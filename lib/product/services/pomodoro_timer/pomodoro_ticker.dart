import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTicker {
  PomodoroTicker(this.onTick);

  final VoidCallback onTick;
  Timer? _timer;

  void start() {
    stop();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => onTick());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() => stop();
}
