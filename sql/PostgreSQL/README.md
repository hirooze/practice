# PostgreSQL 基本コマンド一覧

PostgreSQLを使用する際によく使う基本的なコマンドをまとめました。

## 1. 接続・切断

| 動作 | コマンド | 説明 |
| :--- | :--- | :--- |
| **接続** | `psql -U [ユーザー名] -d [DB名]` | 指定したユーザーとDBで接続します |
| **切断** | `\q` | psqlを終了します |

## 2. データベース操作

| 動作 | コマンド (SQL / psql) | 説明 |
| :--- | :--- | :--- |
| **DB一覧表示** | `\l` | 存在するデータベースの一覧を表示します |
| **DB切り替え** | `\c [DB名]` | 操作対象のデータベースを切り替えます |
| **DB作成** | `CREATE DATABASE [DB名];` | 新しいデータベースを作成します |
| **DB削除** | `DROP DATABASE [DB名];` | データベースを削除します |

## 3. テーブル操作

| 動作 | コマンド (SQL / psql) | 説明 |
| :--- | :--- | :--- |
| **テーブル一覧** | `\dt` | 現在のDB内のテーブル一覧を表示します |
| **テーブル定義確認** | `\d [テーブル名]` | テーブルのカラムや型、インデックス詳細を表示します |
| **テーブル作成** | `CREATE TABLE [表名] (列名 型, ...);` | 例: `CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT);` |
| **テーブル削除** | `DROP TABLE [テーブル名];` | テーブルを削除します |

## 4. データ操作 (CRUD)

### データの挿入 (INSERT)
```sql
INSERT INTO [テーブル名] (カラム1, カラム2) VALUES (値1, 値2);
-- 例
INSERT INTO users (name, age) VALUES ('Taro', 25);
```

### データの取得 (SELECT)
```sql
SELECT * FROM [テーブル名];
-- 条件指定
SELECT * FROM [テーブル名] WHERE [条件];
-- 例
SELECT * FROM users WHERE age > 20;
```

### データの更新 (UPDATE)
```sql
UPDATE [テーブル名] SET [カラム名] = [新しい値] WHERE [条件];
-- 例
UPDATE users SET age = 26 WHERE name = 'Taro';
```

### データの削除 (DELETE)
```sql
DELETE FROM [テーブル名] WHERE [条件];
-- 例
DELETE FROM users WHERE name = 'Taro';
```

## 5. ユーザー・権限管理

| 動作 | コマンド | 説明 |
| :--- | :--- | :--- |
| **ユーザー一覧** | `\du` | ユーザー（ロール）の一覧を表示します |
| **ユーザー作成** | `CREATE USER [ユーザー名] WITH PASSWORD '[パスワード]';` | 新規ユーザーを作成します |
| **権限付与** | `GRANT ALL PRIVILEGES ON DATABASE [DB名] TO [ユーザー名];` | DBに対する全権限をユーザーに付与します |

## 6. その他 便利コマンド

- `\?`: psqlコマンドのヘルプを表示
- `\h [SQLコマンド]`: 特定のSQLコマンドの構文ヘルプを表示 (例: `\h CREATE TABLE`)
- `\x`: クエリ結果の表示を拡張モード（縦並び）に切り替え。カラムが多い時に便利です。

---
作成日: 2026/01/09
