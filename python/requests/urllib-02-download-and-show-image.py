import uuid
from urllib.request import urlopen, Request
from tkinter import Tk, Label
from PIL import ImageTk, Image


url = 'https://neodb.social/m/book/2021/09/154ed4cacf-1716-4882-ae95-77f5459378f4.jpg'
headers = {
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
}
req = Request(url)
for key, value in headers.items():
    req.add_header(key, value)
u = urlopen(req)
resp = u.read()
filename = f"image-{uuid.uuid4()}.jpg"
with open(filename, 'wb') as f:
    f.write(resp)


root = Tk()
root.title("Downloaded Image")

image = Image.open(filename)
photo = ImageTk.PhotoImage(image)
label = Label(root, image=photo)
label.pack()

root.mainloop()
