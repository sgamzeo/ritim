import 'package:ritim/product/base/base_getx_service.dart';
import 'pomodoro_state.dart';
import 'pomodoro_ticker.dart';

import 'package:flutter/material.dart';

class SessionTimerService extends BaseGetxService {
  SessionTimerService({required this.totalDuration, this.onFinished}) {
    state = PomodoroState(totalDuration);
    ticker = PomodoroTicker(_tickHandler);
  }

  final Duration totalDuration;
  final VoidCallback? onFinished;

  late final PomodoroState state;
  late final PomodoroTicker ticker;

  void start() {
    if (state.isRunning) return;
    ticker.start();
    state.start();
  }

  void pause() {
    if (state.isRunning) {
      ticker.stop();
      state.pause();
    }
  }

  void reset() {
    ticker.stop();
    state.reset(totalDuration);
  }

  void _tickHandler() {
    if (state.remainingTime.value <= Duration.zero) {
      ticker.stop();
      state.finish();
      onFinished?.call();
    } else {
      state.decrement();
    }
  }

  @override
  void onClose() {
    ticker.dispose();
    super.onClose();
  }
}
