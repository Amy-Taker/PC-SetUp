# `fish` のインストール

Ubuntuのデフォルトのシェルは以下のようにbashである．しかし，fish (friendly interactive shell) のほうが使いやすいので，シェルを変える．

カーネルとのやり取りをするシェルは毎日つかうものなので，使いやすい方がよい．

```shell
esho $SHELL
> /bin/bash
```

[シェル(Shell)とは？仕組みや種類・シェルスクリプトの実行方法まで解説！](https://udemy.benesse.co.jp/development/system/shell.html)

> shは、UNIX系のOSで使用できるシェルの中で最も古くから存在します。AT&Tベル研究所のスティーブン・ボーン氏によって開発されました。
> 
> ...
> 
> shが開発者の名前にちなんで「Bourneシェル」と呼ばれることに対して、それを生まれ変わらせたシェルという意味の「Bourne Again Shell」の略称で、bashと名付けられています。

[シェルとは | 「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典](https://wa3.i-3-i.info/word11219.html)

> 「sh」を筆頭に「sh」「bash」「ksh」がsh系派閥です。
> 「csh」を筆頭に「csh」「tcsh」がcsh系派閥です。
> そして、どちらの派閥とも仲良くしたがっている「zsh」があります。

## 方針

以下の2つの方針を提示する

1. すべてにおいてfishを使う
2. bashの環境にfishをかぶせる

### 1. すべてにおいてfishを使う

新規環境構築ではこちらでもいいかもしれない．
ただ，bashの方がマジョリティであるため，Ubuntu関連の多くのWeb記事がbashの表記であるため，不具合の場合にSHELL由来か否か判断する能力が必要かも．
特にfishはfishrcなどのファイルが存在せず，読み替えに若干の手間が必要でありPATHを通すのが面倒であるのも事実．

- [fishで「パスを通す」ための最終解答](https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer)

### 2. bashの環境にfishをかぶせる

PATH読み込みなどの実態はbashだが，表示はfishにする手法．
上述の問題が解決するが，見かけはfishなのに，実態はbashになるので，常に注意が必要であるという問題点がある．

[fish - ArchWiki](https://wiki.archlinux.jp/index.php/Fish)

> デフォルトのシェルを Bash にして、 `exec fish` という行を `.bashrc` などの適切な Bash#設定ファイル に追加するだけでよいのです。これにより、Bash は `/etc/profile` と `/etc/profile.d` にあるすべてのファイルを適切にソースするようになります。fish は Bash のプロセスを置き換えるので、fish を終了すると端末も終了します。以下のオプションと比較すると、これはローカルマシンでも SSH サーバでも動作するため、最も普遍的な解決策と言えます。
> 
> ヒント:
> 
> - このセットアップでは、`bash --norc` を使用して、`~/.bashrc` からコマンドを実行せずに手動で Bash に入り、exec fish を実行して fish に戻ります。
> - `bash -c 'echo test'` のようなコマンドを fish の起動ではなくBashで実行させるには、代わりに `if [ -z "$BASH_EXECUTION_STRING" ]; then exec fish; fi` と記述します。
> - 親プロセスが fish でない場合のみ、fish にドロップインします。これにより、bash の設定を失うことなく、`~/.bashrc` コマンドを実行することで bash に素早く入ることができます。
> 
> ```shell
> if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
> then
> 	exec fish
> fi
> ```

## URLs

- [WSLにfish shellをいれる](https://ledsun.hatenablog.com/entry/2021/11/08/221058)
  - 特に改造はしていない普通のインストールガイド
- [WSL2 + Windows Terminal で fish のセットアップ](https://zenn.dev/mammon/articles/90b27354f3ed37)
  - 結構コレを参考にした
- [Fish Shellをかっこよくする方法。bobthefishとCicaできれいなデザイン。](https://exanano.com/programming/fish-shell/)
  - `oh-my-fish/theme-bobthefish` でgitを見やすくするためにfontの話とかが載ってるが，WSLなので参考程度
  - Ubuntu GNOME での実装例
- [fish-shellを使う](https://mgre.co.jp/blog/4045)
  - aliasとか細かいところもフォローしてる
  - 2015年の情報
- [【完全版】fish shell ~スーパーコマンドライン~](https://zenn.dev/sawao/articles/0b40e80d151d6a)
  - fisher の plugin なども記載されている
  - HomebrewなのでMacでの実装か
- [M1 MacにiTerm2+fish shell+Iceberg+bobthefishを導入する](https://zenn.dev/yumemi_inc/articles/603e9bdf1188a1)
  - M1環境でこだわってるけど参考程度
- [Ubuntu20.04のデフォルトshellをfishにする](https://qiita.com/koji9412/items/7e2a15c330c387fc5b3b)
  - それほどカスタムはしてないけど，`.bashrc` に書き込むという情報があり
- [【Ubuntu】 shellをfish + fisherman に変えた話](https://nodaki.hatenablog.com/entry/2018/09/24/213942)
  - Ubuntuでの実装
  - FishとFishermanについてなので詳しく載っているしフォントも変えてるが2018年

とは言いながら，最終回答はやはりDocumentとArchLinuxWiki

- [Install asdf](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)

> デフォルトのシェルに設定するのですが、本当に起動時からデフォルト設定にしてしまうと、今まで.bashrcなどに様々な設定を書き込んでいた場合は、その依存関係が読み込めなくなってしまいます。
> 
> そこで、bashを残しつつ、あたかもデフォルトで起動するような設定にします。
> 
> .bashrcの最終行に次の一文を追記します。
> 
> ```shell
> exec fish
> ```
> 
> こうすることでbashを呼び出した後でfishを呼び出すようにします。

## HowTo

```bash
sudo apt-add-repository ppa:fish-shell/release-3;\
sudo apt update;\
sudo apt install fish -y;\
which fish;\

chsh -s /usr/bin/fish
```

- `sudo apt-add-repository ppa:fish-shell/release-3;\`
  - fishのレポジトリを追加
- `sudo apt update;\`
  - 念のためアプデ
- `sudo apt install fish -y;\`
  - fishのインストール
- `which fish;\`
  - PATHの確認
- `chsh -s /usr/bin/fish`
  - `chsh`(ChangeShell)コマンド: ログインシェルを変更する -> [参考](https://www.ibm.com/docs/ja/aix/7.1?topic=c-chsh-command)

```bash
take@AmyDynabook:~$ sudo apt-get update
[sudo] password for take:
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Hit:2 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [457 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [108 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:7 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [123 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [10.2 kB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [349 kB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [52.6 kB]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata [604 B]
Get:12 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [735 kB]
Get:13 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [130 kB]
Get:14 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [15.6 kB]
Get:15 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [30.2 kB]
Get:16 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [5828 B]
Get:17 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [252 B]
Get:18 http://archive.ubuntu.com/ubuntu jammy/universe Translation-en [5652 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:20 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:21 http://archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:22 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8372 B]
Get:23 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [676 kB]
Get:24 http://archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [183 kB]
Get:25 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [15.1 kB]
Get:26 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [350 kB]
Get:27 http://archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [52.8 kB]
Get:28 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata [604 B]
Get:29 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [921 kB]
Get:30 http://archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [194 kB]
Get:31 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [20.0 kB]
Get:32 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [35.3 kB]
Get:33 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [8452 B]
Get:34 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [468 B]
Get:35 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [40.9 kB]
Get:36 http://archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [10.2 kB]
Get:37 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:38 http://archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:39 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [23.4 kB]
Get:40 http://archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [15.0 kB]
Get:41 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [548 B]
Get:42 http://archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 25.2 MB in 10s (2417 kB/s)
Reading package lists... Done
```

インストール
映画 サークル

```bash
$ sudo apt-add-repository ppa:fish-shell/release-3
$ sudo apt update
$ sudo apt install fish
```



```bash
take@AmyDynabook:~$ sudo apt-add-repository ppa:fish-shell/release-3
Repository: 'deb https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu/ jammy main'
Description:
This archive contains releases made from the Fish 3.x series.

To install fish, run the following commands:
Get:6 https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy/main amd64 Packages [580 B]
Get:7 https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy/main Translation-en [288 B]
Fetched 18.4 kB in 4s (4094 B/s)
Reading package lists... Done
```
```bash
take@AmyDynabook:~$ sudo apt update
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
107 packages can be upgraded. Run 'apt list --upgradable' to see them.
```
```bash
take@AmyDynabook:~$ sudo apt install fish
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libpcre2-32-0 xsel
Suggested packages:
  xdg-utils
The following NEW packages will be installed:
  fish libpcre2-32-0 xsel
0 upgraded, 3 newly installed, 0 to remove and 107 not upgraded.
Need to get 2729 kB of archives.
After this operation, 16.3 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpcre2-32-0 amd64 10.39-3ubuntu0.1 [194 kB]
Get:2 https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy/main amd64 fish amd64 3.6.1-1~jammy [2515 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/universe amd64 xsel amd64 1.2.0+git9bfc13d.20180109-3 [20.5 kB]
Fetched 2729 kB in 4s (765 kB/s)
Selecting previously unselected package libpcre2-32-0:amd64.
(Reading database ... 24112 files and directories currently installed.)
Preparing to unpack .../libpcre2-32-0_10.39-3ubuntu0.1_amd64.deb ...
Unpacking libpcre2-32-0:amd64 (10.39-3ubuntu0.1) ...
Selecting previously unselected package fish.
Preparing to unpack .../fish_3.6.1-1~jammy_amd64.deb ...
Unpacking fish (3.6.1-1~jammy) ...
Selecting previously unselected package xsel.
Preparing to unpack .../xsel_1.2.0+git9bfc13d.20180109-3_amd64.deb ...
Unpacking xsel (1.2.0+git9bfc13d.20180109-3) ...
Setting up xsel (1.2.0+git9bfc13d.20180109-3) ...
Setting up libpcre2-32-0:amd64 (10.39-3ubuntu0.1) ...
Setting up fish (3.6.1-1~jammy) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
```
```bash
take@AmyDynabook:~$ which fish
/usr/bin/fish
take@AmyDynabook:~$ /usr/bin/fish
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
take@AmyDynabook ~> which bash
/usr/bin/bash
take@AmyDynabook ~> /usr/bin/bash
take@AmyDynabook:~$
```