import 'package:get/get.dart';

class CountdownController extends GetxController {
  int _maxTime = 120;

  int get maxTime => _maxTime;

  Future<void> reverseCountdown() async {
    for (int i = 0; i < 120; i++) {
      await Future.delayed(const Duration(seconds: 1));
      _maxTime--;
      update();
    }
  }
}
