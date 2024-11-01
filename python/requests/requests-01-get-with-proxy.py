import requests

proxies = {
   'http': 'http://127.0.0.1:56868',
}
url = 'https://www.v2ex.com/'

r = requests.post(url, proxies=proxies)
print(r.text)

