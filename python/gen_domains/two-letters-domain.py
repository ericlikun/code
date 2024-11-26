import string
from itertools import product

chars = string.ascii_lowercase + string.digits
domains = [''.join(item) for item in product(chars, repeat=2)]

with open('domains.txt', 'w') as f:
    for domain in domains:
        f.write(domain + '\n')