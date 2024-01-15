## 4. SetUp `Python`

- [Pythonの仮想環境構築](https://zenn.dev/mook_jp/articles/1d915a0aef83a7)
- [Python環境構築[Pyenv+Poetry]](https://zenn.dev/zenizeni/books/a64578f98450c2/viewer/c6af80)
- [その実験、再現できますか？pyenvとpoetryによる “そんなに頑張らない” 再現可能な実験環境構築](https://data.gunosy.io/entry/can-you-reproduce-the-experiment-pyenv-poetry)
- [Pythonのパッケージ管理ベストプラクティス - Qitta](https://qiita.com/c60evaporator/items/b6a7394231d1e768ce64)

いままでの環境は`Conda`を使用していたが，

- Python のバージョンはそれほど変更しない
- Mac と Windows, Linux で環境移築が面倒
- conda環境でpipインストールしていたので崩壊の危険があった

などの理由から卒業を図りたいと思う．

代替案として，`venv`の導入を試行する．`Poetry`を使用する案もあったが，新規ツールを増やすことで不安定要素を増やすことになるため保留する．

新規案 - [参考](https://qiita.com/c60evaporator/items/b6a7394231d1e768ce64#%E5%86%92%E9%A0%AD%E3%81%A7%E7%B4%B9%E4%BB%8B%E3%81%97%E3%81%9F3%E6%96%B9%E6%B3%95%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E3%83%84%E3%83%BC%E3%83%AB)

- A.インタープリタ切替
  - Conda -> pyenv
- B.パッケージ切替
  - (Conda & pip) -> venv
- C.パッケージインストール
  - (Conda & pip) -> pip
- D.リポジトリ
  - Conda -> PyPI

これで，Pythonのファイルの保管ディレクトリに，module情報を同時に保管して，実行時に読み出し，実行に最適な環境をよみだせるようになるのではないか…

### `anyenv`のインストール

`pyenv`にパスを通すのがわりと面倒なので，`anyenv`でパスを通して，`anyenv`を用いて`pyenv`を入れましょう

- [anyenvとpyenvでPythonをインストールする - Qitta](https://qiita.com/suke_masa/items/f4db76408b4739de11e3)
- [WSL2 + VScode + nodenv(anyenv)の環境構築方法まとめ - Qitta](https://qiita.com/masako5121/items/2afa847cab1a67be1f47)
- [オールインワンな開発環境をanyenvで構築する](https://zenn.dev/ryuu/articles/use-anyversions)

```bash
take@LAPTOP-A7DFPRBS:~$ anyenv --version
anyenv: command not found
take@LAPTOP-A7DFPRBS:~$ git clone https://github.com/anyenv/anyenv ~/.anyenv
Cloning into '/home/take/.anyenv'...
remote: Enumerating objects: 505, done.
remote: Counting objects: 100% (109/109), done.
remote: Compressing objects: 100% (66/66), done.
remote: Total 505 (delta 54), reused 77 (delta 36), pack-reused 396
Receiving objects: 100% (505/505), 89.55 KiB | 2.98 MiB/s, done.
Resolving deltas: 100% (234/234), done.
take@LAPTOP-A7DFPRBS:~$ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
take@LAPTOP-A7DFPRBS:~$ echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
take@LAPTOP-A7DFPRBS:~$ ~/.anyenv/bin/anyenv init
# Load anyenv automatically by adding
# the following to ~/.bash_profile:

eval "$(anyenv init -)"

take@LAPTOP-A7DFPRBS:~$ anyenv install --init
anyenv: command not found
take@LAPTOP-A7DFPRBS:~$ 
```

うまくいかなかったのでもう一度

```bash
take@LAPTOP-A7DFPRBS:~$ source .bash_profile 
ANYENV_DEFINITION_ROOT(/home/take/.config/anyenv/anyenv-install) doesn't exist. You can initialize it by:
> anyenv install --init
take@LAPTOP-A7DFPRBS:~$ ~/.anyenv/bin/anyenv init
# Load anyenv automatically by adding
# the following to ~/.bash_profile:

eval "$(anyenv init -)"

take@LAPTOP-A7DFPRBS:~$ anyenv install --init
Manifest directory doesn't exist: /home/take/.config/anyenv/anyenv-install
Do you want to checkout https://github.com/anyenv/anyenv-install.git? [y/N]: y
Cloning https://github.com/anyenv/anyenv-install.git master to /home/take/.config/anyenv/anyenv-install...
Cloning into '/home/take/.config/anyenv/anyenv-install'...
remote: Enumerating objects: 71, done.
remote: Counting objects: 100% (14/14), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 71 (delta 4), reused 4 (delta 1), pack-reused 57
Receiving objects: 100% (71/71), 13.15 KiB | 1.20 MiB/s, done.
Resolving deltas: 100% (11/11), done.

Completed!
take@LAPTOP-A7DFPRBS:~$ anyenv --version
anyenv 1.1.5-1-g5c58783
take@LAPTOP-A7DFPRBS:~$ 
```

できたので確認

```bash
take@LAPTOP-A7DFPRBS:~$ anyenv install -l
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
take@LAPTOP-A7DFPRBS:~$ 
```

### `pyenv`のインストール

```bash
take@LAPTOP-A7DFPRBS:~$ anyenv install pyenv
/tmp/pyenv.20230406161623.3277 ~
Cloning https://github.com/pyenv/pyenv.git master to pyenv...
Cloning into 'pyenv'...
remote: Enumerating objects: 22989, done.
remote: Counting objects: 100% (536/536), done.
remote: Compressing objects: 100% (183/183), done.
remote: Total 22989 (delta 419), reused 398 (delta 343), pack-reused 22453
Receiving objects: 100% (22989/22989), 4.67 MiB | 6.82 MiB/s, done.
Resolving deltas: 100% (15557/15557), done.
Updating files: 100% (1071/1071), done.
~

Install pyenv succeeded!
Please reload your profile (exec $SHELL -l) or open a new session.
take@LAPTOP-A7DFPRBS:~$ anyenv --version
anyenv 1.1.5-1-g5c58783
take@LAPTOP-A7DFPRBS:~$ pyenv --version
pyenv 2.3.17
take@LAPTOP-A7DFPRBS:~$ 
```

### `Python`のインストール

[公式ドキュメント](https://github.com/pyenv/pyenv/wiki)が言及している依存パッケージをインストールする

```bash
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

できた

```bash
take@LAPTOP-A7DFPRBS $ pyenv install 3.9
Downloading Python-3.9.16.tar.xz...
-> https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
Installing Python-3.9.16...
Installed Python-3.9.16 to /home/take/.anyenv/envs/pyenv/versions/3.9.16
take@LAPTOP-A7DFPRBS $ pyenv versions
* system (set by /home/take/.anyenv/envs/pyenv/version)
  3.9.16
take@LAPTOP-A7DFPRBS $
take@LAPTOP-A7DFPRBS $ pyenv versions
* system (set by /home/take/.anyenv/envs/pyenv/version)
  3.9.16
take@LAPTOP-A7DFPRBS $ pyenv global 3.9
take@LAPTOP-A7DFPRBS $ python --version
Python 3.9.16
take@LAPTOP-A7DFPRBS:~$ pip --version
pip 22.0.4 from /home/take/.anyenv/envs/pyenv/versions/3.9.16/lib/python3.9/site-packages/pip (python 3.9)
take@LAPTOP-A7DFPRBS:~$
```

### `venv`

#### 環境の構築

```bash
cd プロジェクト用フォルダのパス
python -m venv [新しい環境名]
```

#### 環境の起動

Linux/Macの場合: 

```bash
source [環境名]/bin/activate
```

Windows(コマンドプロンプト)の場合: 

```shell
[環境名]\Scripts\activate.bat
```

#### 不具合(2)

```bash
take@LAPTOP-A7DFPRBS:~$ pyenv install -l
Available versions:
  2.1.3
  2.2.3
  2.3.7
  2.4.0
  (中略)
  stackless-3.4.2
  stackless-3.4.7
  stackless-3.5.4
  stackless-3.7.5
take@LAPTOP-A7DFPRBS:~$ pyenv install 3.9.0
Downloading Python-3.9.0.tar.xz...
-> https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz
Installing Python-3.9.0...
patching file Misc/NEWS.d/next/Build/2021-10-11-16-27-38.bpo-45405.iSfdW5.rst
patching file configure
patching file configure.ac

BUILD FAILED (Ubuntu 22.04 using python-build 2.3.17)

Inspect or clean up the working tree at /tmp/python-build.20230406165646.1409
Results logged to /tmp/python-build.20230406165646.1409.log

Last 10 log lines:
checking for python3... python3
checking for --enable-universalsdk... no
checking for --with-universal-archs... no
checking MACHDEP... "linux"
checking for gcc... no
checking for cc... no
checking for cl.exe... no
configure: error: in `/tmp/python-build.20230406165646.1409/Python-3.9.0':
configure: error: no acceptable C compiler found in $PATH
See `config.log' for more details
take@LAPTOP-A7DFPRBS:~$
```

`BUILD FAILED (Ubuntu 22.04 using python-build 2.3.17)`ってなって失敗したんだが

[コレ](https://pouhon.net/pyenv-error/2009/)と同じエラーで

```bash
configure: error: no acceptable C compiler found in $PATH
```

Cのコンパイラのエラーっぽいので，ビルドツールをインストール

```bash
sudo apt install build-essential
```

再びエラー

```bash
take@LAPTOP-A7DFPRBS:~$ pyenv install 3.9.0
Downloading Python-3.9.0.tar.xz...
-> https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz
Installing Python-3.9.0...
patching file Misc/NEWS.d/next/Build/2021-10-11-16-27-38.bpo-45405.iSfdW5.rst
patching file configure
patching file configure.ac

BUILD FAILED (Ubuntu 22.04 using python-build 2.3.17)

Inspect or clean up the working tree at /tmp/python-build.20230406170837.3553
Results logged to /tmp/python-build.20230406170837.3553.log

Last 10 log lines:
  File "/tmp/python-build.20230406170837.3553/Python-3.9.0/Lib/ensurepip/__init__.py", line 210, in _main
    return _bootstrap(
  File "/tmp/python-build.20230406170837.3553/Python-3.9.0/Lib/ensurepip/__init__.py", line 129, in _bootstrap
    return _run_pip(args + [p[0] for p in _PROJECTS], additional_paths)
  File "/tmp/python-build.20230406170837.3553/Python-3.9.0/Lib/ensurepip/__init__.py", line 38, in _run_pip
    return subprocess.run([sys.executable, "-c", code], check=True).returncode
  File "/tmp/python-build.20230406170837.3553/Python-3.9.0/Lib/subprocess.py", line 524, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['/tmp/python-build.20230406170837.3553/Python-3.9.0/python', '-c', '\nimport runpy\nimport sys\nsys.path = [\'/tmp/tmptfco8p_m/setuptools-49.2.1-py3-none-any.whl\', \'/tmp/tmptfco8p_m/pip-20.2.3-py2.py3-none-any.whl\'] + sys.path\nsys.argv[1:] = [\'install\', \'--no-cache-dir\', \'--no-index\', \'--find-links\', \'/tmp/tmptfco8p_m\', \'--root\', \'/\', \'--upgrade\', \'setuptools\', \'pip\']\nrunpy.run_module("pip", run_name="__main__", alter_sys=True)\n']' returned non-zero exit status 1.
make: *** [Makefile:1254: install] Error 1
take@LAPTOP-A7DFPRBS:~$ 
```

Cのコンパイラのエラーっぽいので，ビルドツールをインストール

```bash
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

```bash
take@LAPTOP-A7DFPRBS:~$ pyenv install 3.9
Downloading Python-3.9.16.tar.xz...
-> https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
Installing Python-3.9.16...
Installed Python-3.9.16 to /home/take/.anyenv/envs/pyenv/versions/3.9.16
take@LAPTOP-A7DFPRBS:~$
```

#### 不具合(1)

環境変数への理解不足

```bash 
take@LAPTOP-A7DFPRBS:~$ pyenv --version
Command 'pyenv' not found, did you mean:
  command 'p7env' from deb libnss3-tools (2:3.68.2-0ubuntu1.2)
Try: sudo apt install <deb name>
take@LAPTOP-A7DFPRBS:~$ anyenv --version
anyenv: command not found
take@LAPTOP-A7DFPRBS:~$ source .bash_profile 
take@LAPTOP-A7DFPRBS:~$ anyenv --version
anyenv 1.1.5-1-g5c58783
take@LAPTOP-A7DFPRBS:~$ pyenv --version
pyenv 2.3.17
take@LAPTOP-A7DFPRBS:~$ 
```

なんか，`.bash_profile`を`source`しないとうまく動かないのだが…

[本当に正しい .bashrc と .bash_profile の使ひ分け - Qitta](https://qiita.com/magicant/items/d3bb7ea1192e63fba850)

shell を再起動したらうまくいった
WSLのshell 再起動は，Windowsで一度`$ wsl --shutdown`を行わないといけないんだな…と

