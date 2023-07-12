import 'package:simple_mvvm/simple_mvvm.dart';

class HomePageViewModel extends BaseScreenViewModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    refreshView();
  }
}
