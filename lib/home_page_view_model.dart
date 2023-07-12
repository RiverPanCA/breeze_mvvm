import 'package:simple_mvvm/infrastructure/base/base_screen_view_model.dart';

class HomePageViewModel extends BaseScreenViewModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    refreshView();
  }
}
