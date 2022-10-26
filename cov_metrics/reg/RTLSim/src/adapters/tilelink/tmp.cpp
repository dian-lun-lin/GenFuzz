#include <functional>
#include <iostream>


//template <typename ... Args>
//class Callback {
  //public:
    //std::function<void(Args...)> call;
    //Callback(std::function<void(Args...)> f): call{std::move(f)} {}
//};
typedef std::function<void()> Callback;

// CallBack functions which tilelink adapter should run
template <typename F, typename... Args>
Callback submit(F&& f, Args&&... args) {
  return [&](){
    f(std::forward<Args>(args)...);
  };
}

//template <typename ... Args>
//Callback<Args...>
//class Callback {
  //public:
    //std::function<int(size_t, float)> call;
//};
void add(int a, int b, int& c) {
  c += a + b;
}

int main() {
  //Callback<int, size_t, float> ca([](size_t x, float y) { return 3; });
  int c = 3;
  auto func = submit(&add, 1, 2, c);
  func();
  std::cout << "c" << c << "\n";
}
