
import 'dart:async';

import 'package:get/get.dart';

class BreastfeedingController extends GetxController {
  Timer? _timer;

  // Reactive variables
  RxInt seconds = 0.obs;
  RxBool isRunning = false.obs;
  RxString activeSide = ''.obs;
  RxInt leftSideSeconds = 0.obs;
  RxInt rightSideSeconds = 0.obs;

  void startTimer(String side) {
    if (isRunning.value && activeSide.value == side) {
      // Pause timer if same side tapped and running
      pauseTimer();
    } else if (!isRunning.value) {
      // Start timer
      activeSide.value = side;
      isRunning.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        seconds.value++;
        if (activeSide.value == 'L') {
          leftSideSeconds.value++;
        } else if (activeSide.value == 'R') {
          rightSideSeconds.value++;
        }
      });
    } else if (isRunning.value && activeSide.value != side) {
      // Switch sides
      pauseTimer();
      activeSide.value = side;
      isRunning.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        seconds.value++;
        if (activeSide.value == 'L') {
          leftSideSeconds.value++;
        } else if (activeSide.value == 'R') {
          rightSideSeconds.value++;
        }
      });
    }
  }

  void pauseTimer() {
    _timer?.cancel();
    isRunning.value = false;
  }

  void restartTimer() {
    _timer?.cancel();
    seconds.value = 0;
    isRunning.value = false;
    activeSide.value = '';
    leftSideSeconds.value = 0;
    rightSideSeconds.value = 0;
  }

  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}