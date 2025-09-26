# Bash Shell コマンドリスト
### ファイルの解凍
```bash
tar -xzvf <ファイル>.tar.gz
```
### ファイルの圧縮
```bash
tar -czvf <ファイル名>.tar.gz <元ファイル>
```
### 容量の確認
```bash
df -h
```
### viで行番号表示
```bash
:set number
```
### 設定ファイルの設定項目の表示
```bash
grep -v -e ^#s*$ -e ^\s*$ <ファイルパス>
```
