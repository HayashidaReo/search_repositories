# 担当者１
## GOOD
- READMEに開発環境やアーキテクチャなどを記入していたり、PULL_REQUEST_TEMPLATEを用意していたりとチーム開発を意識したプロジェクトになっています
- WidthMargin/HeightMarginやColorStyleなど、共通で使用できるものをクラスでまとめて使用している
- ダークモードとライトモードの切り替えができています
- 多言語化対応を行っており、4ヶ国語に対応しています
- 独自にFirebase Authenticationを用いてGitHub認証を行っております
- コミットの粒度が細かく、Pull requestsの機能も用いて開発が行えています
- .vscodeディレクトリを配置し、Visual Studio Codeの機能を活用しています
- CachedNetworkImageを使用して、画像をキャッシュしています
- アーキテクチャがしっかり設計されており、可読性の向上につながっています

## NEXT
- [] 改善点にも記載していただいていますが、GitHub Actionsなどでテストやリント、フォーマットが問題ないかを確認できるとよいと思います
- [] Cursorを活用されているとのことでしたが、.cursor/rulesや.mdcファイル（非推奨ではありますが、.cursorrulesファイルなど）がありませんでした
  - このあたりを整理すると、記載いただいた課題の改善に繋がるのかなと思いました
- [] Pull requestsの機能は用いられているため、Pull requestsに対応するIssueが作成されていると、対応するタスクが明確にでき、かつ後から見直した時になぜこの対応を行ったのかが明確になると思います
  - PULL_REQUEST_TEMPLATEに背景など、対応した理由なども記入するような構成になっていれば、Pull requestsのみでも問題ないとは思います
- [] .vscode/settings.jsonではcSpellの設定を記入しているため、.vscode/extensions.jsonを作成し、Code Spell Checkerを追加しているとなおよいと思います
- [] fvm等、Flutterのバージョン管理ツールを導入しているとなおよいと思います
- [] CachedNetworkImageを使用する際は、Semanticsウィジェットでラップし、適切なラベルを付けるようにするとアクセシビリティの観点でよいと思います
- [] test/custom_button_test.dart内の「色が反転するオプションが機能する」テストが失敗しています
- [] クエリの長さに制限があるため、バリデーションを追加するのがよいと思います
  - https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#limitations-on-query-length


## その他
- [] Androidでは「GitHubでログイン」ボタンをタップしても以下のエラーとなっています
  - [GetAuthDomainTask] Error getting project config. Failed with INVALID_CERT_HASH 400
  - フィンガープリントの登録を行っていないため、エラーとなってしまう分には問題ありませんが、android/app/build.gradle内でkeystoreの設定がされているとなおよいと思います
  - エラーハンドリングができている点はGoodでした
- [] ドキュメンテーションコメントが書かれている点は良かったのですが、補足しなくても変数名等のコードから読み取れるようなものにまでコメントがあり、人によっては可読性が落ちるかもしれません

## まとめ
- CI/CDの実装はないものの、細かくコンポーネントに切り分けて実装されており、ディレクトリ構成もしっかり設計されていました。
- また、独自のログイン機能も追加しており、良かったです。



# 担当者2
## GOOD
- READMEが充実しており、どのような機能を実装したのかがわかりやすいです。
- AIを活用されている点も素晴らしいと思いました。
  - 特に、LLMが出力したコードをそのまま鵜呑みに実装していない
- Riverpodを十分に理解し使いこなせていると思いました
  - `ref.onDispose`を使って、破棄されるタイミングの後処理も実装していました

- GoRouterのPathと名前を`AppRoute class`に切り出し、typoを防ぐ実装にしていました
  - `go_router_builder`を使うと、BuildRunnerでコード生成できるので それを使うのもアリだと思います
- assetを管理する`AppAssets`クラスを作成していました
  - こちらも、`flutter_gen`パッケージを使うと コード生成できるのでおすすめです

## NEXT
- [] `pubspec.yaml`において、バージョンを指定しているものとしていないものに分かれているのが少し気になりました。
  - `pubspec.lock`を見ればどのバージョンを使っているか定まりますが、`pubspec.yaml`にもバージョン指定をしておくと 意図しないバージョン(例えば、とても古いバージョンになっていた など)になることを防ぐことにもつながると思います。
- [] `LocaleNotifier`等で`SharedPreferences`を使う時に 毎回`SharedPreferenfces.getInstance()`を呼び出していますが、Riverpodでキャッシュしても良いと思います。
  - 個人的には、getInstanceするFutureProviderと、それをキャッシュしたProviderを用意してあげる構成が好きです
    ```dart
    // main.dart からのみアクセスする前提
    Future<SharedPreferences> sharedPreferencesInternal(...) async =>
    SharedPreferences.getInstance();

    // Notifier等からはこれを使う
    SharedPreferences sharedPreferences(...) => ref.watch(sharedPreferencesInternal).requireValue;

    Future<void> main() async {
    final sharedPreferences = await sharedPreferencesInternal();
    final container = ProviderContainer(overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ]);
    // ...
    }
    ```

- [] fvmやasdf, miseといったツールのバージョン管理ツールを使うと 単一PCで複数プロジェクトを行う時や 他のPCでも同じバージョンを使うようにできるので おすすめです
- [] `AuthRepo`のbuild関数で`ref.read(firebaseAuthInstanceProvider).currentUser`を行い、`signInWithGitHub`関数等の最後で状態を更新していますが `ref.watch(firebaseAuthInstanceProvider.select((value) => value.currentUser))`で監視できるので こちらを使う方が良いと思いました
  - Riverpodの仕組みに乗っかれるところは乗っかったほうがバグを減らせると思います
- [] `searchGitHubController`だけグローバルの非同期関数として定義し、UI側 FutureBuilderで表示するようにしたのかが気になりました
  - RiverpodのFamilyFutureProviderを使えば、キャッシュできるようになると思います
- [] `GithubApiError`のmessage部分はいくつかのパターンに分けられると思います。従って、`enum GithubApiErrorReason`等を定義しUI側で具体的なメッセージへ出し分けする方が良いと思います。
- [] `String fomratStars`は1箇所のUIからしか参照されていないため Widget側に実装を移すほうが良いと思いました。
  - `lib/function/`配下に関数を雑多に作成していってしまうと いつの間にかぐちゃぐちゃになってしまいます
- [] freezed, json_serializableでJSONパースをさせるモデル(Ex. ApiResponse)でsnake_caseなフィールド名を`@JsonKey(name: ...)`で指定していますが、`@JsonSerializable(fieldRename: FieldRename.snake)`で指定すると フィールド名を自動でsnake_caseに変換してくれるので こちらを使う方が良いと思います
  - `build.yaml`の`targets.$default.builders.json_serializable.options.field_rename = snake`に設定すると デフォルトですべてのフィールドをsnake_caseに変換してくれます

## まとめ
- 総じて完成度が高いと思いました
  - GitHub認証させて、ユーザのTokenでGitHub APIにアクセスさせる設計は素敵だと思いました
- しかし、ところどころ気になるところがありました。
- ページング処理やソート等を実装しようとすると現状の設計だとうまくいかないところが出てくると思いますので、ぜひ実装してみてください
- Integration Test等も実装できると保守性が高まりますので 挑戦してみてください