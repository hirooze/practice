# PlantUML 導入ガイド

このフォルダにはPlantUMLが導入されています。PlantUMLはUML図を作成するためのオープンソースツールです。

## 必要な環境
- Java (OpenJDK 21 がインストール済み)
- Graphviz (dot コマンドが必要)

## 使用方法
PlantUMLのJARファイルは `plantuml.jar` です。

### 基本的な実行
```bash
java -Djava.awt.headless=true -jar plantuml.jar [オプション] [ファイル]
```

### 例: バージョン確認
```bash
java -Djava.awt.headless=true -jar plantuml.jar -version
```

### 例: PlantUMLファイルから画像生成
```bash
java -Djava.awt.headless=true -jar plantuml.jar example.puml
```

### オプション
- `-version`: バージョン表示
- `-help`: ヘルプ表示
- `-tpng`: PNG形式で出力
- `-tsvg`: SVG形式で出力

## PlantUMLファイルの例
`example.puml` ファイルを作成:
```
@startuml
Alice -> Bob: Hello
Bob --> Alice: Hi
@enduml
```

これをPNGに変換:
```bash
java -Djava.awt.headless=true -jar plantuml.jar example.puml
```

## 注意
- ヘッドレスモード (`-Djava.awt.headless=true`) を使用してGUI依存を回避してください。
- Graphvizがインストールされているため、全種類の図を生成可能です。