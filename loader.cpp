#include <iostream>
#include <cstdlib>
#include <ctime>
#include <Windows.h>

int main() {
    system("start cmd.exe");
    srand(static_cast<unsigned int>(time(NULL)));

    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, FOREGROUND_GREEN);

    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 10; j++) {
            std::cout << rand() % 10000000000000000000 << " ";
        }
        std::cout << std::endl;
        Sleep(1000);
    }

    std::cout << "Connected to Roblox client" << std::endl;

    return 0;
}
