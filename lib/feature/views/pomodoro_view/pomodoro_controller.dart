import 'dart:async';
import 'package:get/get.dart';

class PomodoroController extends GetxController {
  var remainingTime = (25 * 60).obs; // 25 dakika
  var isRunning = false.obs;
  Timer? _timer;

  void startTimer() {
    if (_timer != null && _timer!.isActive) return;

    isRunning.value = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime.value--;
      } else {
        stopTimer();
        // Bildirim vb. ekleyebilirsin burada
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    isRunning.value = false;
  }

  void resetTimer() {
    _timer?.cancel();
    remainingTime.value = 25 * 60;
    isRunning.value = false;
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning.value = false;
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
