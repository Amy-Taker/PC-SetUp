# `Node.js` Install

```bash
$ asdf plugin list all | grep node
nodejs                        https://github.com/asdf-vm/asdf-nodejs.git
$ asdf plugin add nodejs
$ asdf list all nodejs
0.1.14
0.1.15
0.1.16
...
18.10.0
18.11.0
18.12.0
18.12.1
18.13.0
18.14.0
18.14.1
18.14.2
18.15.0
18.16.0
19.0.0
19.0.1
19.1.0
19.2.0
19.3.0
19.4.0
19.5.0
19.6.0
19.6.1
19.7.0
19.8.0
19.8.1
19.9.0
20.0.0
20.1.0
20.2.0
$
```

```bash
$ asdf install nodejs 18.16.0
Trying to update node-build... ok
Downloading node-v18.16.0-linux-x64.tar.gz...
-> https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.gz
Installing node-v18.16.0-linux-x64...
Installed node-v18.16.0-linux-x64 to /home/take/.asdf/installs/nodejs/18.16.0

$ asdf global nodejs 18.16.0
$ node --version
v18.16.0
$
```