part of '../pomodoro_view.dart';

class _StartStopButtonWidget extends BaseGetView<PomodoroController> {
  const _StartStopButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isRunning = controller.timerStatus.value == PomodoroStatus.running;

      return CustomButton(
        text:
            isRunning
                ? LocalizationKeys.pauseTextKey.tr
                : LocalizationKeys.startTextKey.tr,
        onTap: () {
          if (isRunning) {
            controller.pause();
          } else {
            controller.start();
          }
        },
        controllerTag: 'startPauseButton',
      );
    });
  }
}
