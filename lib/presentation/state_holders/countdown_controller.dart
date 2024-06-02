import 'package:get/get.dart';

class CountdownController extends GetxController {
  int _maxTime = 0;

  int get maxTime => _maxTime;

  Future<void> reverseCountdown() async {
    _maxTime = 0;
    _maxTime = 300;
    for (int i = 0; i < 300; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (_maxTime > 0) _maxTime--;
      update();
    }
  }
}
