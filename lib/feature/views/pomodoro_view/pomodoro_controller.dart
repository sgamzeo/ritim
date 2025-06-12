import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:ritim/product/constants/enums.dart';
import 'package:ritim/product/utils/extensions.dart';

class PomodoroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final Duration totalDuration = const Duration(minutes: 1);
  Rx<PomodoroStatus> status = PomodoroStatus.initial.obs;

  double get progress => animationController.value;
  String get formattedTime =>
      animationController.value.remainingDuration(totalDuration).formatToMMSS();

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: totalDuration,
    );

    animationController.addStatusListener((animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        status.value = PomodoroStatus.finished;
      }
    });
  }

  void controlTimer(PomodoroStatus newStatus) {
    switch (newStatus) {
      case PomodoroStatus.initial:
        animationController.reset();
        status.value = PomodoroStatus.initial;
        break;
      case PomodoroStatus.running:
        if (!animationController.isAnimating) {
          animationController.forward(from: animationController.value);
          status.value = PomodoroStatus.running;
        }
        break;
      case PomodoroStatus.paused:
        if (animationController.isAnimating) {
          animationController.stop();
          status.value = PomodoroStatus.paused;
        }
        break;
      case PomodoroStatus.finished:
        // TODO: bildirim vb. eklenebilir.
        break;
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
