意見/議論/issues/PRs歓迎です。
issueを作るか、既存のissueに参加してスタイル作成に参加してください！！

----

良いライブラリ、そして他のライブラリと衝突しないライブラリを作るために、いくつかの規則を制定します

# コーディングの前に
  ライブラリであるから、コマンドラインオプションは好ましくありません。
  なるべくシンプルに作成してください。


# コードの初期化
  * shebangは必要ありません(これは良いのか?)
  * 最初に、ライブラリのまとめを書いてください

  例:
  ```
    # libtkinsh.sh  -- Tkinter in Shellscript
    #
    # ver: 0.0.1
    # tags: graphic UI
    # desc: Make UI easier. Provide a lot of UI parts and user interface.
    # dependencies: 
    #
    # copyright (c) 2018 Cj-bc
    # This software is released under MIT License.
    #
  ```

  `blib.generate_doc`によって読まれるため、最後の行は'#'のみを書いてください。

# coding style
  基本的には、自由にコーディングできます。
  ただし、衝突を避けるためにいくつかの規則があります。

  1. 関数名の前にライブラリ名をつける

        一単語の名前: "get" "func"
        簡単な単語から成る名前: "testfunc"
      これらは、衝突の可能性を考えると良くない名付けです。
      ライブラリ名をつけるのが良い選択です。
        "get" -> "Tkinsh::get"
      (これには様々な形式があると思いますが、どれでもいいと思います)

  2. 環境変数の前にライブラリ名をつける
      1と同じです。

  3. `local`フラグで変数を定義する
    衝突を避けるために、スコープを制限してください。

  4. 関数外にコードを書かない
    言うまでもないと思います。
    `blib`はライブラリ全体をsourceします。
    そのため、関数外のコードはそのまま実行されます。
    ただし、初期化コードに関しては例外です。

# コメント
  `blib`はコメントから`blib info`/`blib man`用のテキストを自動で生成します。
  そのため、以下の形式で書いてください。

  1. 関数の前に説明をかく
    ユーザーが調べやすいよう、説明を書いてください。

    例: [Cj-bc/vstult-3](https://github.com/Cj-bc/vstult-3)内の'box'関数

    ```
      # Draw box. can contains texts
      # @stdin string text
      # @stdout string text same as stdin
      # @param <int start_y> <int width> <int height> <string left|center|right>
      # @return 0 success
    ```

  2. 環境変数の前に説明をかく
    環境変数の説明を追加してください。

    例:
    ```
      # @env library path
      export BLIB_PATH="/usr/local/lib/blib"
    ```


# レポジトリについて
  ライブラリはGithubで管理してください。
  他の環境へのサポートもしますが、現状はGithubのみがサポートされています。
