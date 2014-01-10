# docker-xpressengine

This is Dockerfile for building
[xpressengine](https://github.com/rauhryan/xpressengine) application
image. This image doesn't have a database server. If you don't have
any database, I recommand using
[docker-xpressengine-mysql](https://github.com/nacyot/docker-xpressengine-mysql)
which includes Mysql server.

# Building Dockerfile

1. Clone this repository.

```sh
$ git clone docker-xpressengine
$ cd docker-xpressengine
```

1. Building image from Dockerfile.

```sh
$ docker build -t nacyot/xpressengine .
```

# Starting Server

```
$ docker run -d -p <PUBLIC_PORT>:80 nacyot/xpressengine
```

Replace `<PUBLIC_PORT>` with the number. You can access your XpressEngine
application on `http://127.0.0.1:<PUBLIC_PORT>/xe`

# Installing XpressEngine

`http://127.0.0.1:<PUBLIC_PORT>/xe`

# Setting up Nginx Proxy

```nginx
upstream xpressengine_server {
  server 127.0.0.1:<PUBILC_PORT>;
}

server {
  server_name <YOUR_DOMAIN>;

  location / {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://xpressengine_server;
  }
}
```

# Author
Daekwon Kim(nacyot) <propellerheaven@gmail.com>.

# License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
