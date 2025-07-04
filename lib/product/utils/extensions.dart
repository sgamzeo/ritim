import 'dart:ui';

import 'package:flutter/painting.dart' show HSLColor;
import 'package:ritim/product/constants/enums.dart';

extension DurationFormatting on Duration {
  String toMMSS() {
    final minutes = inMinutes.toString().padLeft(2, '0');
    final seconds = (inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

extension PomodoroStatusHelper on PomodoroStatus {
  bool get isInitial => this == PomodoroStatus.initial;
  bool get isRunning => this == PomodoroStatus.running;
  bool get isPaused => this == PomodoroStatus.paused;
  bool get isFinished => this == PomodoroStatus.finished;
}

extension ClampedAlphaExtension on double {
  Color toClampedAlpha(Color color) {
    final clampedValue = clamp(0.1, 1.0);
    return color.withAlpha((clampedValue * 255).toInt());
  }
}

extension ColorExtension on Color {
  Color lighten([double amount = 0.2]) {
    final hsl = HSLColor.fromColor(this);
    final lighter = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lighter.toColor();
  }
}
