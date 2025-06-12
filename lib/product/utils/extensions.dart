import 'dart:ui';

extension DurationFormatting on Duration {
  String formatToMMSS() {
    final minutes = inMinutes.toString().padLeft(2, '0');
    final seconds = (inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

extension AnimationValueExtension on double {
  Duration remainingDuration(Duration totalDuration) {
    int remainingSeconds = ((1 - this) * totalDuration.inSeconds).round();
    return Duration(seconds: remainingSeconds);
  }
}

extension ClampedAlphaExtension on double {
  Color toClampedAlpha(Color color) {
    final clampedValue = clamp(0.1, 1.0);
    return color.withAlpha((clampedValue * 255).toInt());
  }
}
