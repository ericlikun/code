#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_LINES 100
#define MAX_LENGTH 256

struct WindowParams {
    char param1[MAX_LENGTH];
    char param2[MAX_LENGTH];
};

int WINAPI WinMain (HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow) {
    FILE *inputFile = fopen("config.txt", "r");
    struct WindowParams windowParamsArray[MAX_LINES];
    int lineCount = 0;
    char line[MAX_LENGTH];
    HWND hWnd;
    int i = 0;
    
    if (inputFile == NULL) {
        printf("Unable to open 'config.txt' file.\n");
        return 1;
    }
    
    while (fgets(line, sizeof(line), inputFile)!= NULL && lineCount < MAX_LINES) {
        line[strcspn(line, "\n")] = '\0';
        sscanf(line, "%[^,],%[^,\n]", windowParamsArray[lineCount].param1, windowParamsArray[lineCount].param2);
        lineCount++;
    }
    fclose(inputFile);
    
	while (1) {
	    for (i = 0; i < lineCount; i++) {
	        LPCSTR pParam1 = (strcmp(windowParamsArray[i].param1, "NULL") == 0) ? NULL : windowParamsArray[i].param1;
	        LPCSTR pParam2 = (strcmp(windowParamsArray[i].param2, "NULL") == 0) ? NULL : windowParamsArray[i].param2;
            hWnd = FindWindow(pParam1, pParam2);
            if (hWnd != NULL) {
                SendMessage(hWnd, WM_CLOSE, 0, 0);
            }
	    }
        Sleep(1000);
	}
    return 0;
}

