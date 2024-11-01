# urllib 是一个相对高级的接口
# urllib 更好的命名或许是 internetlib

from urllib.request import urlopen # python3


url = 'https://blog.tt4e.com/'
u = urlopen(url)
resp = u.read()
print(resp)

