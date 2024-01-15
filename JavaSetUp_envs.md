# JavaEnv

```bash
$ anyen
v install --list
  Renv
  crenv
  denv
  erlenv
  exenv
  goenv
  hsenv
  jenv
  jlenv
  kubectlenv
  luaenv
  nodenv
  phpenv
  plenv
  pyenv
  rbenv
  sbtenv
  scalaenv
  swiftenv
  tfenv
$
```

```bash
$ anyenv install jenv
/tmp/jenv.20230416233947.476 /mnt/c/Users/Takeru/OneDrive - Shizuoka University/00_PC-SetUp/00_LaTeXtestEnv
Cloning https://github.com/jenv/jenv.git master to jenv...
Cloning into 'jenv'...
remote: Enumerating objects: 1362, done.
remote: Counting objects: 100% (143/143), done.
remote: Compressing objects: 100% (78/78), done.
remote: Total 1362 (delta 75), reused 107 (delta 57), pack-reused 1219
Receiving objects: 100% (1362/1362), 468.62 KiB | 7.10 MiB/s, done.
Resolving deltas: 100% (636/636), done.
/mnt/c/Users/Takeru/OneDrive - Shizuoka University/00_PC-SetUp/00_LaTeXtestEnv

Install jenv succeeded!
Please reload your profile (exec $SHELL -l) or open a new session.
$ exec $SHELL -l
jenv has been updated, process to refresh plugin links
$ jenv --version
jenv 0.5.6-2-g2329e5c
$ jenv versions
$ echo ${JAVA_HOME}

$
```

```bash
$ which anyenv
/home/take/.anyenv/bin/anyenv
$ which pyenv
/home/take/.anyenv/envs/pyenv/bin/pyenv
$ which jenv
/home/take/.anyenv/envs/jenv/bin/jenv
$ jenv versions
$
```

```bash
$ code README.md
$ jenv doctor
[OK]    No JAVA_HOME set
$ jenv enable-plugin export
You may restart your session to activate jenv export plugin echo export plugin activated
$ exec $SHELL -l
```

[これ](https://qiita.com/r-gamma/items/bb6ba528a05b0a218a60)を見ていると，`jenv`は`pyenv`のように実行環境をインストールすることがはできず，インストールした`JDK`を紐づけて Version を変換できるだけの模様

- [brew + anyenv + jEnvでJavaのインストール[M1 Mac検証済]](https://qiita.com/r-gamma/items/bb6ba528a05b0a218a60)
- [cask+anyenv+jenvを使ったJavaのバージョン管理](https://qiita.com/kanican0813/items/c7bb016e353461c8a0df)
- [anyenvを用いてCleanなMac開発環境(pyenv, nodenv, jenv)を構築する](https://zenn.dev/duke13/articles/9c74dd595823cbd)
- [jenvで複数バージョンのJDKを切り替える](https://takezoe.hatenablog.com/entry/2020/04/20/233219)

```bash
$ javac
Command 'javac' not found, but can be installed with:
sudo apt install openjdk-11-jdk-headless  # version 11.0.18+10-0ubuntu1~22.04, or
sudo apt install default-jdk              # version 2:1.11-72build2
sudo apt install openjdk-17-jdk-headless  # version 17.0.6+10-0ubuntu1~22.04
sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
sudo apt install openjdk-8-jdk-headless   # version 8u362-ga-0ubuntu1~22.04
sudo apt install ecj                      # version 3.16.0-1
$ sudo apt install default-jdk
(中略)
$
```

- [openjdk-7-jre-headlessとopenjdk-7-jre（jdk）の違いは何ですか？](https://www.web-dev-qa-db-ja.com/ja/java/openjdk7jreheadless%E3%81%A8openjdk7jre%EF%BC%88jdk%EF%BC%89%E3%81%AE%E9%81%95%E3%81%84%E3%81%AF%E4%BD%95%E3%81%A7%E3%81%99%E3%81%8B%EF%BC%9F/1055535524/)

> ヘッドレスモードは、ディスプレイデバイス、キーボード、またはマウスが不足しているシステム構成です。予想外のように聞こえますが、実際には、グラフィックモードでも、このモードでさまざまな操作を実行できます。

``bash
$ java --version
openjdk 11.0.18 2023-01-17
OpenJDK Runtime Environment (build 11.0.18+10-post-Ubuntu-0ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.18+10-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
$ javac --version
javac 11.0.18
$ which javac
/usr/bin/javac
$ which java
/usr/bin/java
$
```

```bash
$ jenv add `/usr/libexec/java_home -v "11"`
bash: /usr/libexec/java_home: No such file or directory
openjdk64-11.0.18 added
11.0.18 added
11.0 added
11 added
$ jenv versions
* system (set by /home/take/.anyenv/envs/jenv/version)
  11
  11.0
  11.0.18
  openjdk64-11.0.18
$
```

なんかセットアップミスった気がする

```bash
$ sudo apt remove default-jdk
[sudo] password for take:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  default-jdk-headless libice-dev libsm-dev libxt-dev openjdk-11-jdk openjdk-11-jdk-headless
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  default-jdk
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 6144 B disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 99235 files and directories currently installed.)
Removing default-jdk (2:1.11-72build2) ...
$ source update
()
$ javac --version
Command 'javac' not found, but can be installed with:
sudo apt install openjdk-11-jdk-headless  # version 11.0.18+10-0ubuntu1~22.04, or
sudo apt install default-jdk              # version 2:1.11-72build2
sudo apt install openjdk-17-jdk-headless  # version 17.0.6+10-0ubuntu1~22.04
sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
sudo apt install openjdk-8-jdk-headless   # version 8u362-ga-0ubuntu1~22.04
sudo apt install ecj                      # version 3.16.0-1
$ java --version
openjdk 11.0.18 2023-01-17
OpenJDK Runtime Environment (build 11.0.18+10-post-Ubuntu-0ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.18+10-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
$ which java
/usr/lib/jvm/default-java/bin/java
$ sudo apt remove default-java
[sudo] password for take:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package default-java
$ ls /usr/lib/jvm
default-java  java-1.11.0-openjdk-amd64  java-11-openjdk-amd64
$
```

- [Ubuntu 18.04 にて jenv を用いて複数のバージョンの Java を使い分ける方法](https://obel.hatenablog.jp/entry/20191013/1570930581)
- 