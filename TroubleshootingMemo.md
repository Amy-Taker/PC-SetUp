# Internet

1. `ping`
2. `tracert`
3. `telnet`

## `telnet`

Macでは`telnet`が基本セットから外されたので，`curl`を使用する

```SHELL
curl -v telnet:// https://gakujo.shizuoka.ac.jp/portal/
```

### 出力例

```SHELL
% curl -v telnet:// https://www.google.com               
* Closing connection -1
curl: (3) URL using bad/illegal format or missing URL
*   Trying 172.217.25.164:443...
* Connected to www.google.com (172.217.25.164) port 443 (#0)
* ALPN: offers h2,http/1.1
* (304) (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/cert.pem
*  CApath: none
* (304) (IN), TLS handshake, Server hello (2):
* (304) (IN), TLS handshake, Unknown (8):
* (304) (IN), TLS handshake, Certificate (11):
* (304) (IN), TLS handshake, CERT verify (15):
* (304) (IN), TLS handshake, Finished (20):
* (304) (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / AEAD-CHACHA20-POLY1305-SHA256
* ALPN: server accepted h2
* Server certificate:
*  subject: CN=www.google.com
*  start date: May 29 08:22:10 2023 GMT
*  expire date: Aug 21 08:22:09 2023 GMT
*  subjectAltName: host "www.google.com" matched cert's "www.google.com"
*  issuer: C=US; O=Google Trust Services LLC; CN=GTS CA 1C3
*  SSL certificate verify ok.
* using HTTP/2
* h2h3 [:method: GET]
* h2h3 [:path: /]
* h2h3 [:scheme: https]
* h2h3 [:authority: www.google.com]
* h2h3 [user-agent: curl/7.88.1]
* h2h3 [accept: */*]
* Using Stream ID: 1 (easy handle 0x14280e200)
> GET / HTTP/2
> Host: www.google.com
> user-agent: curl/7.88.1
> accept: */*
> 
< HTTP/2 200 
< date: Wed, 28 Jun 2023 07:13:40 GMT
...
```
