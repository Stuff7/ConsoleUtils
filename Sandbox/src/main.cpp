#include <iostream>
#include <ConsoleDimensions.h>

int main() {
  int width=0, height=0;
  ConsoleUtils::get_console_size(width, height);
  std::cout << "width=" << width << ", height=" << height << std::endl;
}
