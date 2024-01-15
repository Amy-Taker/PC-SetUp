# `java` Install

openjdk-17 が LTS で，18 のリリース 2022/3/22 から1年以上たってるので openjdk-18 が安定してそう．
リリースノートを見ていると，Version が変わるごとにおおきな更新はないので，最新を入れもいい．
となると，2023/09 リリースの 21 が LTS なので，それに一番近いのは，`openjdk-20.0.1` かな．

- [Java 20新機能まとめ](https://qiita.com/nowokay/items/e42a7c7f403fd5f85d16)
- [Java 18新機能まとめ](https://qiita.com/nowokay/items/17d990aa8a5b1c5223c8)
- [JDK、Oracle JDK、OpenJDK、Java SEってなに？](https://qiita.com/nowokay/items/c1de127354cd1b0ddc5e)

```bash
$ asdf plugin list all | grep java
java                          https://github.com/halcyon/asdf-java.git
$ asdf plugin add java
$ asdf plugin list
java
python
```

```bash
$ asdf list all java | grep ^openjdk
openjdk-9
openjdk-9.0.1
openjdk-9.0.4
openjdk-10
openjdk-10.0.1
openjdk-10.0.2
openjdk-11
openjdk-11.0.1
openjdk-11.0.2
openjdk-12
openjdk-12.0.1
openjdk-12.0.2
openjdk-13
openjdk-13.0.1
openjdk-13.0.2
openjdk-14
openjdk-14.0.1
openjdk-14.0.2
openjdk-15
openjdk-15.0.1
openjdk-15.0.2
openjdk-16
openjdk-16.0.1
openjdk-16.0.2
openjdk-17
openjdk-17.0.1
openjdk-17.0.2
openjdk-18
openjdk-18.0.1
openjdk-18.0.1.1
openjdk-18.0.2
openjdk-18.0.2.1
openjdk-19
openjdk-19.0.1
openjdk-19.0.2
openjdk-20
openjdk-20.0.1
$
```

```bash
$ asdf install java openjdk-20.0.1
############################################################################################### 100.0%
openjdk-20.0.1_linux-x64_bin.tar.gz
openjdk-20.0.1_linux-x64_bin.tar.gz: OK
$ asdf global java openjdk-20.0.1
$ javac --version
javac 20.0.1
$ java --version
openjdk 20.0.1 2023-04-18
OpenJDK Runtime Environment (build 20.0.1+9-29)
OpenJDK 64-Bit Server VM (build 20.0.1+9-29, mixed mode, sharing)
$
```

```bash
$ asdf list
java
  openjdk-18.0.2.1
  openjdk-18
 *openjdk-20.0.1
python
 *3.11.3
$ asdf uninstall java openjdk-18
$ asdf list
java
  openjdk-18.0.2.1
 *openjdk-20.0.1
python
 *3.11.3
$
```
