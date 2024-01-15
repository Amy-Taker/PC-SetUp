# SetUp for Windows 11

Windows は ByPass をいじることで色々小賢しいことができる

- [Windows 11インストール時にシステム要件チェックをパスする方法](https://itlogs.net/windows-11-install-bypass/)
  - OSインストール時に `TPM 2.0`，`セキュアブート`などのシステム要件チェックを回避してパスする方法
- [Windows 11 Home／ProをMicrosoftアカウントではなくローカルアカウントで設定する裏技](https://atmarkit.itmedia.co.jp/ait/articles/2210/21/news023.html)
  - どうしても Microsoft アカウントを紐づけたい Windows 11 くんに無理矢理ローカルアカウントを作成する方法

そのほか大抵のことは Windows 10 と一緒

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

[情報系以外の方にもおすすめしたいMarkdown](https://trap.jp/post/371/)

## 4. SetUp `Python`

## 4. SetUp `LaTeX`

## 5. SetUp `Git`

## Tips. `CapsLockキー`について

MacBook の日本語配列では CapsLock に当たる位置に Ctrl が割り当てられているので，変換しておくと対応が便利になる(気がする)

[Windows 11 - CapsLockキーを Ctrlキーに入れ替える方法](https://pc-karuma.net/map-capslock-to-control-in-windows-11-10/)
