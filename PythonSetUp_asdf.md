# `asdf` Install

`asdf`とは

- [バージョン管理ツール asdf でディレクトリごとにPythonのバージョンを指定する](https://dev.classmethod.jp/articles/try-asdf-settings/)

## 1. `asdf` Install

1. Git から Clone

```bash
sudo apt install curl git ;\
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
```

2. Path を通す

```bash
echo -e ". "$HOME/.asdf/asdf.sh"" >> ~/.bashrc ;\
source .bashrc
```

> ```bash
> $ sudo apt install curl git
> Reading package lists... Done
> Building dependency tree... Done
> Reading state information... Done
> curl is already the newest version (7.81.0-1ubuntu1.10).
> curl set to manually installed.
> git is already the newest version (1:2.34.1-1ubuntu1.9).
> git set to manually installed.
> 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
> $ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
> Cloning into '/home/take/.asdf'...
> remote: Enumerating objects: 8323, done.
> remote: Counting objects: 100% (186/186), done.
> remote: Compressing objects: 100% (108/108), done.
> Receiving objects: 100% (8323/8323), done.
> Resolving deltas: 100% (4944/4944), done.
> Note: switching to '0adc6c11fb4f87dbb476f8b61e4cf8fb7613599b'.
> 
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by switching back to a branch.
> 
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -c with the switch command. Example:
> 
>   git switch -c <new-branch-name>
> 
> Or undo this operation with:
> 
>   git switch -
> 
> Turn off this advice by setting config variable advice.detachedHead to false
> 
> $ echo -e ". "$HOME/.asdf/asdf.sh"" >> ~/.bashrc
> $ source .bashrc
> $ asdf --version
> v0.11.3-0adc6c1
> $
> ```

## 2. python plugin Install

0. 念のためアプデ，`asdf` のプラグインの中から `Python` という名称のものを検索

```bash
asdf update ;\
asdf plugin list all | grep python
```

1. `python` のプラグインを追加し，実際に追加されていることを確認

```bash
asdf plugin add python ;\
asdf plugin list
```

> ```bash
> $ asdf plugin list all | grep python
> Cloning into '/home/take/.asdf/repository'...
> remote: Enumerating objects: 5187, done.
> remote: Counting objects: 100% (5187/5187), done.
> remote: Compressing objects: 100% (2359/2359), done.
> Receiving objects: 100% (5187/5187), done.
> Resolving deltas: 100% (2802/2802), done.
> Updating files: 100% (678/678), done.
> python                        https://github.com/danhper/asdf-python.git
> $ asdf update
> HEAD is now at 0adc6c1 chore(master): release 0.11.3 (#1498)Updated asdf to release v0.11.3
> $ asdf plugin add python
> $ asdf plugin list
> python
> $
> ```

### Compare with `pyenv`

同様の機能を持つ`pyenv`と比較しても，同じ機能が提供されていることがわかる．

> ```bash
> $ asdf list all python 3.11
> 3.11.0
> 3.11-dev
> 3.11.1
> 3.11.2
> 3.11.3
> ```

> ```bash
> $ asdf list all python | grep 3.11
> 3.11.0
> 3.11-dev
> 3.11.1
> 3.11.2
> 3.11.3
> miniconda3-4.3.11
> pypy2.7-7.3.11-src
> pypy2.7-7.3.11
> pypy3.8-7.3.11-src
> pypy3.8-7.3.11
> pypy3.9-7.3.11-src
> pypy3.9-7.3.11
> $
> ```

> ```bash
> $ pyenv install --list | grep 3.11
>   3.11.0
>   3.11-dev
>   3.11.1
>   3.11.2
>   3.11.3
>   miniconda3-4.3.11
>   pypy2.7-7.3.11-src
>   pypy2.7-7.3.11
>   pypy3.8-7.3.11-src
>   pypy3.8-7.3.11
>   pypy3.9-7.3.11-src
>   pypy3.9-7.3.11
> $
> ```

## 3. python Insatall

ここで`BUILD FAILED`が発生する可能性があるが，詳細と対応は[後述](#解決策)．

1. お気に入りのVersionをインストールする

```bash
asdf install python 3.11.3
```

> ```bash
> $ asdf install python 3.11.3
> python-build 3.11.3 /home/take/.asdf/installs/python/3.11.3
> Downloading Python-3.11.3.tar.xz...
> -> https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tar.xz
> Installing Python-3.11.3...
> Installed Python-3.11.3 to /home/take/.asdf/installs/python/3.11.3
> ```

2. 環境に設定する

```bash
asdf global python 3.11.3
```

なお，引数を `local` にするとカレントディレクトリのみに適用できる．

> ```bash
> asdf local python 3.8.10
> ```

3. 確認諸々

> ```bash
> $ asdf list
> python
>   3.11.3
> $ python --version
> Python 3.11.3
> $ which python
> /home/take/.asdf/shims/python
> $ pip --version
> pip 22.3.1 from /home/take/.asdf/installs/python/3.11.3/lib/python3.11/site-packages/pip (python 3.11)
> $
> ```

## Error

### build-error(1)

見たことあるエラーが出た．まっさらUbuntuででるそうな．

- [[WSL]pyenvへのPythonインストールで出るエラーを解決する](https://pouhon.net/pyenv-error/2009/)

```bash
$ asdf install python 3.11.3
python-build 3.11.3 /home/take/.asdf/installs/python/3.11.3
Downloading Python-3.11.3.tar.xz...
-> https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tar.xz
Installing Python-3.11.3...

BUILD FAILED (Ubuntu 22.04 using python-build 2.3.18)

Inspect or clean up the working tree at /tmp/python-build.20230526110831.10891
Results logged to /tmp/python-build.20230526110831.10891.log

Last 10 log lines:
checking for pkg-config... no
checking for --enable-universalsdk... no
checking for --with-universal-archs... no
checking MACHDEP... "linux"
checking for gcc... no
checking for cc... no
checking for cl.exe... no
configure: error: in `/tmp/python-build.20230526110831.10891/Python-3.11.3':
configure: error: no acceptable C compiler found in $PATH
See `config.log' for more details
$
```

基本的なツールが足りないということなので，

```bash
sudo apt install build-essential
```

で解決することがあるが，他にも足りないものがあるので，[後述](#build-error2)のエラーが後続する可能性もある．

<!-- **解決策**

```bash
$ sudo apt install build-essential
[sudo] password for take:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0 libcrypt-dev libdeflate0 libdpkg-perl libfakeroot libfile-fcntllock-perl libfontconfig1 libfreetype6 libgcc-11-dev
  libgd3 libgomp1 libisl23 libitm1 libjbig0 libjpeg-turbo8 libjpeg8 liblsan0 libmpc3 libnsl-dev libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev libtsan0 libubsan1 libwebp7 libxpm4
  linux-libc-dev lto-disabled-list make manpages-dev rpcsvc-proto
Suggested packages:
  bzip2-doc cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib gcc-11-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc gcc-11-multilib glibc-doc bzr
  libgd-tools libstdc++-11-doc make-doc
The following NEW packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base libalgorithm-diff-perl libalgorithm-diff-xs-perl
  libalgorithm-merge-perl libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0 libcrypt-dev libdeflate0 libdpkg-perl libfakeroot libfile-fcntllock-perl libfontconfig1
  libfreetype6 libgcc-11-dev libgd3 libgomp1 libisl23 libitm1 libjbig0 libjpeg-turbo8 libjpeg8 liblsan0 libmpc3 libnsl-dev libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev libtsan0
  libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make manpages-dev rpcsvc-proto
0 upgraded, 53 newly installed, 0 to remove and 0 not upgraded.
Need to get 64.0 MB of archives.
After this operation, 208 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-dev-bin amd64 2.35-0ubuntu3.1 [20.4 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-libc-dev amd64 5.15.0-72.79 [1331 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/main amd64 libcrypt-dev amd64 1:4.4.27-1 [112 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 rpcsvc-proto amd64 1.4.2-0ubuntu6 [68.5 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libtirpc-dev amd64 1.3.2-2ubuntu0.1 [192 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 libnsl-dev amd64 1.3.0-2build2 [71.3 kB]
...
``` -->

### build-error(2)

よくわからないが，`pyenv` と同じ環境を用意しておけば問題ないのではなかろうか，ということで [GitHub/pyenv - wiki](https://github.com/pyenv/pyenv/wiki) を参照．

```bash
$ asdf install python 3.11.3
python-build 3.11.3 /home/take/.asdf/installs/python/3.11.3
Downloading Python-3.11.3.tar.xz...
-> https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tar.xz
Installing Python-3.11.3...

BUILD FAILED (Ubuntu 22.04 using python-build 2.3.18)

Inspect or clean up the working tree at /tmp/python-build.20230526113233.650
Results logged to /tmp/python-build.20230526113233.650.log

Last 10 log lines:
  File "/tmp/python-build.20230526113233.650/Python-3.11.3/Lib/ensurepip/__init__.py", line 202, in _bootstrap
    return _run_pip([*args, *_PACKAGE_NAMES], additional_paths)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/tmp/python-build.20230526113233.650/Python-3.11.3/Lib/ensurepip/__init__.py", line 103, in _run_pip
    return subprocess.run(cmd, check=True).returncode
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/tmp/python-build.20230526113233.650/Python-3.11.3/Lib/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['/tmp/python-build.20230526113233.650/Python-3.11.3/python', '-W', 'ignore::DeprecationWarning', '-c', '\nimport runpy\nimport sys\nsys.path = [\'/tmp/tmp17aexia7/setuptools-65.5.0-py3-none-any.whl\', \'/tmp/tmp17aexia7/pip-22.3.1-py3-none-any.whl\'] + sys.path\nsys.argv[1:] = [\'install\', \'--no-cache-dir\', \'--no-index\', \'--find-links\', \'/tmp/tmp17aexia7\', \'--root\', \'/\', \'--upgrade\', \'setuptools\', \'pip\']\nrunpy.run_module("pip", run_name="__main__", alter_sys=True)\n']' returned non-zero exit status 1.
make: *** [Makefile:1860: install] Error 1
$
```

### 解決策

```bash
sudo apt update; sudo apt -y install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```
