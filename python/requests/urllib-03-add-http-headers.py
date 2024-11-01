# urllib 是一个高级接口
from urllib.request import Request, urlopen # python3

url = 'http://www.tt4e.com/'
headers = {
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
}
req = Request(url)
for key, value in headers.items():
    req.add_header(key, value)
u = urlopen(req)
resp = u.read()
print(resp)
code = u.getcode()
print(code)
