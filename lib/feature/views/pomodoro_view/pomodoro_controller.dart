import 'dart:async';
import 'package:get/get.dart';
import 'package:ritim/product/constants/enums.dart';
import 'package:ritim/product/utils/extensions.dart';

class PomodoroController extends GetxController {
  Timer? _timer;
  final Rx<Duration> remainingTime = const Duration(minutes: 1).obs;
  Rx<PomodoroStatus> status = PomodoroStatus.initial.obs;

  String get formattedTime => remainingTime.value.formattedTime();

  void controlTimer(PomodoroStatus newStatus) {
    switch (newStatus) {
      case PomodoroStatus.initial:
        _timer?.cancel();
        remainingTime.value = const Duration(minutes: 1); // veya dinamik süre
        status.value = PomodoroStatus.initial;
        break;
      case PomodoroStatus.running:
        if (status.value != PomodoroStatus.running) {
          _startTimer();
          status.value = PomodoroStatus.running;
        }
        break;
      case PomodoroStatus.paused:
        if (status.value == PomodoroStatus.running) {
          _timer?.cancel();
          status.value = PomodoroStatus.paused;
        }
        break;
      case PomodoroStatus.finished:
        // İstersen bildirim veya başka işlemler burada olabilir
        break;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > Duration.zero) {
        remainingTime.value = remainingTime.value - const Duration(seconds: 1);
      } else {
        timer.cancel();
        status.value = PomodoroStatus.finished;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
