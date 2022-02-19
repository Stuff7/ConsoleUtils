#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#define VC_EXTRALEAN
#include <Windows.h>
#elif defined(__linux__)
#include <sys/ioctl.h>
#endif // Windows/Linux

namespace ConsoleUtils {
  extern "C" {
    void get_console_size(int &width, int &height);
  }
}
