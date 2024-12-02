import ctypes
from ctypes import wintypes

user32 = ctypes.WinDLL('user32', use_last_error=True)

user32.FindWindowW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR]
user32.FindWindowW.restype = wintypes.HWND

user32.SendMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
user32.SendMessageW.restype = wintypes.HWND

WM_CLOSE = 0x0010

def find_window_and_close(class_name=None, window_name=None):
    hwnd = user32.FindWindowW(class_name, window_name)
    if hwnd == 0:
        error_code = ctypes.get_last_error()
        print(f"窗口未找到，错误代码: {error_code}")
        return False
    
    print(f"找到窗口句柄: {hwnd}")

    result = user32.SendMessageW(hwnd, WM_CLOSE, 0, 0)
    print(f"发送关闭消息结果: {result}")
    return True

if __name__ == "__main__":
    class_name = 'RarReminder'
    window_name = None

    if find_window_and_close(class_name, window_name):
        print("窗口已关闭。")
    else:
        print("未能关闭指定窗口。")
