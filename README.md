# Stack Buffer Overflow 101 Lab

The very basic stack buffer overflow lab

## Let Play

Review source code [chall.c](/chall.c) and find a bug. Please hack this lab on your own environment. And then, get a real flag [ws://stack-buf-overflow-101-lab.herokuapp.com/](ws://stack-buf-overflow-101-lab.herokuapp.com/).

## WebSocket PWN

In heroku platform, we can deploy only web application. Thus, we deployed the PWN challenge using WebSocket protocol. Enjoy WebSocket below !

### netcat to wscat

Connect to lab app with wscat instead. To install wscat, NPM is required.

```
$ npm install -g wscat
$ wscat -c ws://echo.websocket.org
Connected (press CTRL+C to quit)
> hi there
< hi there
> are you a happy parrot?
< are you a happy parrot?
```

### pwnlib.tubes.remote.remote to sock_websocket.WebSock

Connect to lab app with sock_websocket.WebSock instead.

```
$ pip install sock-websocket
[...]
$ cat echo.py
from pwn import *
from sock_websocket import WebSock

# s = process("chall")
# s = remote("1.3.3.7", 1337)
s = WebSock("ws://echo.websocket.org")
s.sendline(b"Hello World !"))
s.interactive()

$ python echo.py                                 
Hello World !
<3
<3
```

## Running Locally

Make sure you have Python 3.7 [installed locally](http://install.python-guide.org). To push to Heroku, you'll need to install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).

```sh
$ git clone https://github.com/suam-team/stack-buf-overflow-101-lab.git
$ cd stack-buf-overflow-101-lab
$ docker build -t stack-buf-overflow-101-lab .
$ docker run -d --rm -p 1337:1337 -e PORT=1337 -e FLAG=flag{ILoveU} stack-buf-overflow-101-lab
```

Your app should now be running on [ws://localhost:1337](ws://localhost:1337).

## Deploying to Heroku

```sh
$ heroku create
$ heroku config:set FLAG=flag{ILoveU}
$ git push heroku main
$ heroku open
```
or

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)