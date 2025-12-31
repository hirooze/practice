#!/usr/bin/env bash
set -euo pipefail

# 変更可能な設定
WORKDIR="$HOME/jenkins-docker"                      # 作業ディレクトリ
JENKINS_IMAGE="jenkins/jenkins:lts-jdk11"           # イメージ（必要なら変更）
VOLUME_NAME="jenkins-data"                          # Dockerボリューム名
ADMIN_ID="${ADMIN_ID:-admin}"                       # 環境変数で上書き可
ADMIN_PASSWORD="${ADMIN_PASSWORD:-S3cureP@ssw0rd}"  # 環境変数で上書き可
ADMIN_FULLNAME="${ADMIN_FULLNAME:-Administrator}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
PLUGINS_FILE="$WORKDIR/plugins.txt"

# 1. 作業ディレクトリと init.groovy.d を作成
mkdir -p "$WORKDIR/init.groovy.d"

cat > "$WORKDIR/init.groovy.d/basic-security.groovy" <<'EOF'
import jenkins.model.*
import hudson.security.*

def env = System.getenv()
def user = env['JENKINS_ADMIN_ID'] ?: 'admin'
def pass = env['JENKINS_ADMIN_PASSWORD'] ?: 'admin'
def fullName = env['JENKINS_ADMIN_FULLNAME'] ?: 'Administrator'
def email = env['JENKINS_ADMIN_EMAIL'] ?: 'admin@example.com'

println("[init.groovy.d] create admin user: " + user)

// create user
def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(user, pass)
instance.setSecurityRealm(hudsonRealm)

// set basic authorization strategy: full control once logged in
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)

instance.save()
EOF

# 2. plugins.txt（必要なプラグインを列挙）
cat > "$PLUGINS_FILE" <<'EOF'
git
workflow-aggregator
docker-workflow
credentials
matrix-auth
ssh-slaves
configuration-as-code
mailer
EOF

# 3. Docker ボリューム作成
docker volume create "$VOLUME_NAME" >/dev/null || true

# 4. Jenkins コンテナ起動（セットアップウィザードを無効化）
#    - init.groovy.d をマウントして初期管理者を作成
#    - plugins.txt を /usr/share/jenkins/ref/plugins.txt にマウントして後でインストール
docker rm -f jenkins >/dev/null 2>&1 || true
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -e JENKINS_ADMIN_ID="$ADMIN_ID" \
  -e JENKINS_ADMIN_PASSWORD="$ADMIN_PASSWORD" \
  -e JENKINS_ADMIN_FULLNAME="$ADMIN_FULLNAME" \
  -e JENKINS_ADMIN_EMAIL="$ADMIN_EMAIL" \
  -e JAVA_OPTS='-Djenkins.install.runSetupWizard=false' \
  -v "$VOLUME_NAME":/var/jenkins_home \
  -v "$WORKDIR/init.groovy.d":/var/jenkins_home/init.groovy.d:ro \
  -v "$PLUGINS_FILE":/usr/share/jenkins/ref/plugins.txt:ro \
  "$JENKINS_IMAGE"

echo "Jenkins を起動しました。コンテナ名: jenkins"

# 5. Jenkins が起動するまで待機（ログに 'Completed initialization' が出るまで）
echo "Jenkins の初期化完了を待っています（ログ監視）。最大 240秒..."
timeout=240
interval=5
elapsed=0
while [ $elapsed -lt $timeout ]; do
  if docker logs jenkins 2>&1 | grep -q "Completed initialization"; then
    echo "Jenkins 初期化完了を検出しました。"
    break
  fi
  sleep $interval
  elapsed=$((elapsed+interval))
  printf "."
done
if [ $elapsed -ge $timeout ]; then
  echo
  echo "警告: Jenkins の初期化がタイムアウトしました。ログを確認してください: docker logs jenkins"
fi

# 6. プラグインをインストール（入れたいプラグインが plugins.txt に列挙されていること）
echo "プラグインをインストールします..."
docker exec -u root jenkins bash -c "set -e; \
  if [ -f /usr/share/jenkins/ref/plugins.txt ]; then \
    cat /usr/share/jenkins/ref/plugins.txt | xargs /usr/local/bin/install-plugins.sh || true; \
  else \
    echo 'plugins.txt が見つかりません'; \
  fi"

# 7. プラグイン反映のため再起動
echo "Jenkins を再起動します..."
docker restart jenkins >/dev/null

# 8. 完了メッセージとアクセス情報
echo "------"
echo "Jenkins の初期セットアップが完了しました（概ね）。"
echo "管理者ユーザー: $ADMIN_ID"
echo "管理者パスワード: $ADMIN_PASSWORD"
echo "アクセス: http://<このマシンのIP>:8080/"
echo "（ブラウザでログインして動作確認してください）"
echo "Jenkins コンテナログ確認: docker logs -f jenkins"
