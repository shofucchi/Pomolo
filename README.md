# Pomolo

## セットアップ

初回セットアップや `project.yml` 変更後は、リポジトリルートで次を実行します。

```sh
make open
```

このコマンドは次の処理を順番に実行します。

1. `mint bootstrap` で `Mintfile` に書かれたツールをインストール
2. `mint run xcodegen generate` で `project.yml` から `Pomolo.xcodeproj` を生成
3. Xcode が未起動の場合のみ `Pomolo.xcodeproj` を開く

個別に実行したい場合は、以下のコマンドも使えます。

```sh
make bootstrap
make generate
```
