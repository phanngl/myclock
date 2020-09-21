import "package:get/get.dart";
import "package:vibration/vibration.dart";
import 'package:quiver/async.dart';

class Controller extends GetxController {
  final count = 0.obs;
  final isRunning = false.obs;
  CountdownTimer cdTimer;

  Controller() {
    //init();
  }

  void init() {
    count.value = 10;
  }

  void startTimer() {
    init();

    isRunning.value = true;
    cdTimer = CountdownTimer(
        Duration(seconds: this.count.value), Duration(seconds: 1));
    cdTimer.listen((event) {})
      ..onData((data) {
        this.count.value--;
      })
      ..onDone(() {
        isRunning.value = false;
        Vibration.vibrate();
      });
  }
}
