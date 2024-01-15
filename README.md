# SetUp for Windows 11

Windows は ByPass をいじることで色々小賢しいことができる

Windows 11 の酷いところは，PCにMSアカウントを紐づけろと強制することころ．
これを有効にすると，Cドライブ下のユーザー空間のストレージが(無料版であれば 5GB しかない)OneDriveに全て接続される．
これにより，Cドライブの容量に余裕があっても，ユーザー空間のストレージが OneDrive の上限に達するとエラーメッセージが多発する，Path に `\OneDrive` が挟まれてソフトウェアが誤作動するなどの面倒なことが沢山起こる．

- [Windows 11インストール時にシステム要件チェックをパスする方法](https://itlogs.net/windows-11-install-bypass/)
  - OSインストール時に `TPM 2.0`，`セキュアブート`などのシステム要件チェックを回避してパスする方法
- [Windows 11 Home／ProをMicrosoftアカウントではなくローカルアカウントで設定する裏技](https://atmarkit.itmedia.co.jp/ait/articles/2210/21/news023.html)
  - どうしても Microsoft アカウントを紐づけたい Windows 11 くんに無理矢理ローカルアカウントを作成する方法

そのほかはUIが異なる程度で大抵のことは Windows 10 と一緒

## ~~強引に~~ローカルアカウントを作成する方法

1. `Shift` ＋ `F10` キーを押し，コマンドプロンプトを起動
2. 以下を実行

```commandline
oobe\BypassNRO.cmd
```

## キーボード配列

### Windows 10

`設定` > `時間と言語` > `優先する言語` > `オプション` > `ハードウェアキーボードレイアウト` > `レイアウトを変更する` > 再起動

### Windows 11

`設定` > `時刻と言語` > `言語と地域` > `日本語` > `…` > `言語のオプション` > `キーボード` > `キーボードレイアウト` > `レイアウトを変更する` > `ハードウェアキーボードレイアウトの変更` > 再起動

# SetUp for Windows 10

## 0. OS Update 

設定からちまちまするのは面倒なので [Windows Update Assistant](https://www.microsoft.com/ja-jp/software-download/windows10) で古いバージョンのものは一気にアプデするのが吉．

一応， [Windows10Upgrade9252.exe](Windows10Upgrade9252.exe) を同梱しておく．
Version は `9252` から変わるが，ネット上から Windows Update assistant が適宜調整してくれる．

## 1. Install `Windows Terminal`

Windows Terminal - [Microsoft Store](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=ja-jp&gl=jp)

あると便利なので入れておく．

Microsoft Store が Microsoft アカウントで認証しないとインストールさせないという改悪を行っているので，渋々認証するか，[色々](https://www.lifehacker.jp/article/150821win10_localaccount/)する．

もしくは，[Git](https://github.com/microsoft/terminal) からダウンロードしてビルドする．ただし，Gitからダウンロードすると自動で Update されなくなるので注意．

## 2. Install `WSL`

Windows 10 で WSL を使用するには `Windows 10 May 2021 Update` 以降に更新することが必須

更新後，`Windows の機能の有効化または無効化` の

- Hyper-V
- Windows Subsystem for Linux
  - Linux 用 Windows サブシステム
- 仮想マシンプラットフォーム

を有効化し，再起動を行い更新を行う

その後，PowerShellを**管理者として**実行し，

```shell
% wsl --version
```

などで`wsl`コマンドが有効になっていることを確認したのち，

```shell
% wsl --install -d Ubuntu
```

などでインストールを行う．
以下に2023/04/04現在のディストリビューションのリストを掲載する

```shell
PS C:\Users\sample> wsl --list --online
インストールできる有効なディストリビューションの一覧を次に示します。
'wsl --install -d <Distro>' を使用してインストールします。

NAME                                   FRIENDLY NAME
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
kali-linux                             Kali Linux Rolling
Ubuntu-18.04                           Ubuntu 18.04 LTS
Ubuntu-20.04                           Ubuntu 20.04 LTS
Ubuntu-22.04                           Ubuntu 22.04 LTS
OracleLinux_8_5                        Oracle Linux 8.5
OracleLinux_7_9                        Oracle Linux 7.9
SUSE-Linux-Enterprise-Server-15-SP4    SUSE Linux Enterprise Server 15 SP4
openSUSE-Leap-15.4                     openSUSE Leap 15.4
openSUSE-Tumbleweed                    openSUSE Tumbleweed
PS C:\Users\sample>
```

- [WSL2 のインストール，WSL2 上への Ubuntu のインストールと利用（Windows 11 対応の記事）（Windows 上） - 福山大工学部情報工学科](https://www.kkaneko.jp/tools/wsl/wsl2.html)

### `pandoc`

```bash
sudo apt install pandoc
```

これをインストールすることで`Markdown`が使いやすくなるのでオススメ

- [多様なフォーマットに対応！ドキュメント変換ツールPandocを知ろう - Qitta](https://qiita.com/sky_y/items/80bcd0f353ef5b8980ee)

## 3. SetUp `Virtual Studio Code`

インストールの際にCodeで開くのアクションを追加しておくと作業が楽なので初期設定でセットアップしてある場合も再度上書きしておくと良いかも(この際，既存のパッケージ環境は破壊されない)

- [Windowsの右クリックメニューに「VSCodeで開く」を追加する - Qitta](https://qiita.com/kaityo256/items/7fefd1d1463184ae1420)

### オススメPackage

- Japanese(ポップアップがでる)
- WSL(ポップアップがでる)
- Markdown All in One(あると便利なので個人的に導入)

## 4. SetUp `Markdown`

この文章も Markdown で記載されているので，細かいことは記載しない．
汎用性と専門性のグラデーションの中では， `Markdown` < `AsciiDoc` < $\LaTeX$ のような関係性な気がしている．

[情報系以外の方にもおすすめしたいMarkdown](https://trap.jp/post/371/)

## Tips. `CapsLockキー`について

MacBook の日本語配列では CapsLock に当たる位置に Ctrl が割り当てられているので，変換しておくと対応が便利になる(気がする)
Ctrl2Cap などのサードパーティーアプリで変更する場合が多い．

- [Windows 11 - CapsLockキーを Ctrlキーに入れ替える方法](https://pc-karuma.net/map-capslock-to-control-in-windows-11-10/)
- [Windows 10で「CapsLock」と「Ctrl」を入れ替える方法【PowerToys編】](https://news.mynavi.jp/techplus/article/20210609-1900755/)

### PowerToys

ここではMicrosoftが公式にリリースしている PowerToys を使用する手法を紹介する．

- [Windowsの便利ツールPowerToysの紹介 - SAKURA internet](https://knowledge.sakura.ad.jp/34042/)
  - もともとWindowsに搭載するはずでしたが搭載されなかった利便性向上機能を複数提供するソフトです。実はWindows 95時代から存在しているソフトで、Windows XPまで提供が続けられていました。Vista以降は提供されていませんでしたが、2019年5月にWindows10向けにオープンソースとして提供が再開されました。
- [Microsoft PowerToys: Windows をカスタマイズするためのユーティリティ - Microsoft](https://learn.microsoft.com/ja-jp/windows/powertoys/)
- [microsoft/PowerToys - GitHub](https://github.com/microsoft/PowerToys/releases)

心躍るものが多いのでオススメ．以下に軽く例示する．

- PCで学習を行う際などにオンデマンドで起動させたままにする[Awake](https://learn.microsoft.com/ja-jp/windows/powertoys/awake)
- 4分割以上詳細に画面を割ってWindowを配置できる[FancyZones](https://learn.microsoft.com/ja-jp/windows/powertoys/fancyzones)
- Markdown ファイルなどをエクスプローラーでプレビュー表示させる[add-ons](https://learn.microsoft.com/ja-jp/windows/powertoys/file-explorer)
- 多数のファイルのファイル名を変更できる[PowerRename](https://learn.microsoft.com/ja-jp/windows/powertoys/powerrename)
- 画像やビデオ内など、画面上の任意の場所からテキストをコピーできる[Text Extractor](https://learn.microsoft.com/ja-jp/windows/powertoys/text-extractor)

なお，[開発環境を Mac から Windows に変更するためのガイド](https://learn.microsoft.com/ja-jp/windows/dev-environment/mac-to-windows)というものを作ってたりする．

#### KeybordManager

日本語配列キーボードで`CapsLock`と`Ctrl`を入れ替えるのは色々と面倒なパターンがある．
いじっていると，日本語配列の`CapsLock`は`CapsLockキー(VK240)`ではなく，`Shift + CapsLockキー(VK240)`をトリガーとする動作が確認できる．

- [Microsoft PowerToysでCaps lockキーとCtrlキーを入れ替えようとしてみたけれど](https://n1729.com/microsoft-powertoys-keyboard-remap/)
- [Windows PC買ったらまずはこれ　［CapsLock］キーの有効活用法 - ITmedeia](https://atmarkit.itmedia.co.jp/ait/articles/2007/10/news016.html)

```txt
Microsoftが開発中の「PowerToys」に、キー配置を行う機能（Keyboard Manager）があるが、原稿執筆時点で最新のバージョン0.19.0においても、入力キーボードが日本語IMEの場合、［CapsLock］キーが正しく認識されず「VK240（仮想キーコード）」となってしまい、他のキーに置き換えることができない
```

- [GitHub/microsoft/PowerToys - Keyboard Manager bug](https://github.com/microsoft/PowerToys/issues/19787#issuecomment-1211500621)

```txt
結論から言うと、osの論理キーボードがjis環境下では、"a"キー左隣の英数/capslockキーをctrlにremapする方法は、現在のpowertoysで期待通りに動作させることは不可能です。

バグではなく日本語imeの挙動が問題なのです。powertoysは正常に動作しています。

解決方法はレジストリを書き換えることが1番簡単です。

os側の論理キーボードがjisの場合のみ発生します。（主にkbd106.dll）

この問題は定期的に報告されているけど、既知かつ誰も修正できていない。2年以上前から。私もかつて修正にトライしたけど、日本語imeモジュールの複雑怪奇な挙動のせいで諦めました。

物理キーボードではなく、os側で指定している論理キーボードドライバーがkbd106.dllが日本語windowsのデフォルトだと思う。確認方法は"p"キーの一つ右横のキーを押して"@"が出力される。

この場合、刻印にはcapslockと書いてあるが、このキーはcapslockのvkを発生させない。英数キーだ。英数キーとは日本語jisドライバに存在するvkで、キーボードのスキャンコードは同じだが、os側での解釈が違いvk240と理解する。

もしjisキーボードでcapslockと同一のvkを発生させたい場合は、shift ＋　英数キー、でcapslockのvkを発生させれる。
```

### Winget

### Ctrl2Cap

[Microsoft](https://learn.microsoft.com/en-us/sysinternals/downloads/ctrl2cap)