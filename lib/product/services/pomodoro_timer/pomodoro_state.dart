// lib/feature/pomodoro/service/pomodoro_state.dart
import 'package:get/get.dart';
import 'package:ritim/product/base/base_getx_service.dart';
import 'package:ritim/product/constants/enums.dart';

class PomodoroState extends BaseGetxService {
  PomodoroState(Duration initialDuration) {
    remainingTime.value = initialDuration;
  }

  final remainingTime = Duration.zero.obs;
  final status = PomodoroStatus.initial.obs;

  void reset(Duration duration) {
    remainingTime.value = duration;
    status.value = PomodoroStatus.initial;
  }

  void start() => status.value = PomodoroStatus.running;
  void pause() => status.value = PomodoroStatus.paused;
  void finish() => status.value = PomodoroStatus.finished;

  void decrement() => remainingTime.value -= const Duration(seconds: 1);

  bool get isInitial => status.value == PomodoroStatus.initial;
  bool get isRunning => status.value == PomodoroStatus.running;
  bool get isPaused => status.value == PomodoroStatus.paused;
  bool get isFinished => status.value == PomodoroStatus.finished;
}
