import requests
import tkinter as tk
from PIL import Image, ImageTk
import io

referer = 'https://abc.com/'
headers = {
    "Referer": referer
}

url = "https://cde.com/1.jpg"
response = requests.get(url, headers=headers)

if response.status_code == 200:
    print("请求成功")
    try:
        img = Image.open(io.BytesIO(response.content))
        root = tk.Tk()
        photo = ImageTk.PhotoImage(img)
        label = tk.Label(root, image=photo)
        label.pack()
        root.mainloop()
    except Exception as e:
        print("无法识别图片文件:", e)
else:
    print("请求失败，状态码：", response.status_code)