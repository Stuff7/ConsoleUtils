#include "ConsoleDimensions.h"

namespace ConsoleUtils {
  void get_console_size(int& width, int& height) {
    #if defined(_WIN32)
      CONSOLE_SCREEN_BUFFER_INFO csbi;
      GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &csbi);
      width = (int)(csbi.srWindow.Right-csbi.srWindow.Left + 1);
      height = (int)(csbi.srWindow.Bottom-csbi.srWindow.Top + 1);
    #elif defined(__linux__)
      struct winsize w;
      ioctl(fileno(stdout), TIOCGWINSZ, &w);
      width = (int)(w.ws_col);
      height = (int)(w.ws_row);
    #endif // Windows/Linux
  }
}
