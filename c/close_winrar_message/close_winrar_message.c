#include <windows.h>

int WINAPI WinMain (HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow)
{
    HWND hWnd;
  
    while (1) {
        hWnd = FindWindow("RarReminder", "WinRAR");
	    SendMessage(hWnd, WM_CLOSE, (LPARAM)0, (WPARAM)0);
        Sleep(1000);
    }
  
    return 0;
}

