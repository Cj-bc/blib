English: [README.md]

# blib
  blibは、bash script用のライブラリマネージャーです。
  パッケージマネージャーではありません。（bash用のパッケージマネージャー: [bpkg/bpkg](https://github.com/bpkg/bpkg))

# このプロジェクトはbash-oo-frameworkを使用しています

このプロジェクトは、基礎部分に [niieani/bash-oo-framework](https://github.com/niieani/bash-oo-framework) を使用しています。
*import*コマンドは、このフレームワークによって提供されているものをカスタマイズしています。

# feature

## Commands:
  * `blib install <lib_name>` -- <lib_name>をインストールします
  * `blib uninstall <lib_name>` -- <lib_name>をアンインストールします
  * `blib list` -- インストール済みのライブラリの一覧を返します
  * `blib info <lib>` -- ライブラリの情報を返します（バージョン等）
  * `blib man <lib>` -- <lib>の詳細を表示します

## スクリプト作成時用コマンド
  * 'import'コマンド  -- スクリプトからライブラリを読み込むのに使用します。 `import blib:<lib>`の形で使用してください。

## 環境変数
  * BLIB_ROOT -- blibのルートパスです。全てのライブラリはこの下に置かれます。 デフォルト: `/usr/local/etc/blib/lib`
                 (Homebrewの場合、`/usr/local/Cellar/blib/<version>/lib`になります)

## Supports:
  * `blib`用のbash補完
  * import文用のomni補完(vim)
  * bpkgでのblibのインストール
  * homebrewでのblibのインストール


# dependencies
  * bash-oo-framework -- 基礎に使っているフレームワークです。 これは*内蔵されています*
  * git -- ライブラリのクローンに使用します
  * realpath -- ユーザーから渡されたライブラリパスの確認用に使用しています。gnucoreutil等で提供されています


# インストール方法

  現状、`3.ソースコードから`のみ対応しています。  
  homebrew対応途中です。  

  1. bpkg

    ```bash
    $ bpkg install Cj-bc/blib
    $ echo "export BLIB_ROOT=/if/you/want/some/other/path"
    ```

  2. homebrew

    ```bash
    $ brew insatll Cj-bc/blib/blib
    $ echo "export BLIB_ROOT=/if/you/want/some/other/path"
    ```

  3. ソースコードから

    ```bash
    $ git clone https://github.com/Cj-bc/blib.git
    $ cd blib
    $ make install
    # blibのルートディレクトリ(本体等が入る。ライブラリは`root/lib`に格納される)を指定したい場合は:
    $ make root=<your/path> install

    ```

# blibライブラリを使用してスクリプトを作成する

スクリプトの一番上に（勿論shebangの後に）以下の行を加えてください:


```bash
source "$(blib --prefix)/bash-oo- framework/lib/oo-bootstrap.sh"
```

これにより、`import`コマンドを用いてライブラリを使用できるようになります。  
この場合、**公式のbash-oo-frameworkを使わないでください**。blibはサポートされていません。  

もしくは、以下のようにすることで直接ライブラリを呼ぶこともできます:

```bash
source "$(blib --prefix)/path/to/the/script"
```

