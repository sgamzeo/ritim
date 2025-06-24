import 'dart:ui';

import 'package:flutter/painting.dart' show HSLColor;

extension DurationFormatting on Duration {
  String formattedTime() {
    final minutes = inMinutes.toString().padLeft(2, '0');
    final seconds = (inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
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
