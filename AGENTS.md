# AGENTS.md

このリポジトリで Codex が作業するときのルールです。ユーザーから明示的な指示がある場合は、その指示を優先してください。

## コミュニケーション

- 回答は原則として日本語で行ってください。
- ユーザーが相談、質問、方針確認をしている段階では、すぐにソースコードを修正しないでください。
- ソースコードを変更する前に、ユーザーが実装や修正を明示的に依頼しているか確認してください。

## プロジェクト概要

- アプリ本体は `Pomolo/` 配下の SwiftUI iOS アプリです。
- Xcode プロジェクトは `project.yml` から XcodeGen で生成します。
- 開発ツールは `Mintfile` で管理します。
- ローカル Swift Package として `BuildTool/SwiftFormatPlugin` を使います。
- SF Symbols は `SFSafeSymbols` を利用できます。

## よく使うコマンド

- 初回セットアップ、プロジェクト生成、Xcode 起動:
  ```sh
  make open
  ```
- Mint 管理ツールのインストール:
  ```sh
  make bootstrap
  ```
- `project.yml` から `.xcodeproj` を生成:
  ```sh
  make generate
  ```

`make open` は `mint bootstrap`、`mint run xcodegen generate` を実行し、Xcode が未起動の場合のみ `Pomolo.xcodeproj` を開きます。

## 編集ルール

- ユーザーが「まだコードは書かなくて良い」「相談したい」などと述べている場合は、説明や提案に留めてください。
- 変更はユーザーの依頼範囲に限定します。
- 既存の未コミット変更を勝手に戻さないでください。
- SwiftUI の既存構成、命名、ファイル配置に合わせてください。
- 大きな設計変更やフォルダ移動は、実装前に意図を確認してください。
- `project.yml` を変更した場合は、原則 `make generate` の実行が必要です。
- 生成された `.xcodeproj` を手で編集するより、原則として `project.yml` を編集してください。

## Swift / SwiftUI 方針

- 型名は UpperCamelCase、プロパティやメソッドは lowerCamelCase にします。
- SwiftUI の状態は必要な範囲で `@State private var` を使います。
- View は小さく分割し、機能ごとの `Components/` に置くことを優先します。
- iOS 18 も考慮する場合、新しい SwiftUI API は `#available` で分岐してください。
- Liquid Glass 系 API を使う場合は、iOS 18 向けに `.ultraThinMaterial` などの fallback を用意してください。
- SF Symbols は可能なら `SFSafeSymbols` を使い、文字列ベースの `systemName` を増やしすぎないでください。

## ディレクトリ方針

- 機能単位の画面は `Pomolo/Feature/<FeatureName>/` に配置します。
- 再利用する小さな UI 部品は、近い機能配下の `Components/` に置きます。
- アプリ全体で共有する部品が増えた場合は、別途 `Shared/` や `DesignSystem/` の追加を検討します。

## 確認ルール

- Swift ファイルを変更したら、可能な限り Xcode のライブ診断またはビルドで確認します。
- ビルドや生成コマンドを実行できなかった場合は、最終報告で理由を明記します。
- UI 変更では、Preview が壊れないように確認してください。

## コメント方針

- 自明な処理にはコメントを増やしません。
- 後から意図が分かりにくい設計判断、XcodeGen 設定、OS availability 分岐には短いコメントを残します。
