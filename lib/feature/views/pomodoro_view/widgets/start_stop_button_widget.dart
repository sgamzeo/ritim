part of '../pomodoro_view.dart';

class _StartStopButtonWidget extends BaseGetView<PomodoroController> {
  const _StartStopButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final isRunning = controller.status.value == PomodoroStatus.running;

        return CustomButton(
          text:
              isRunning
                  ? LocalizationKeys.pauseTextKey.tr
                  : LocalizationKeys.startTextKey.tr,
          onTap:
              () => controller.controlTimer(
                isRunning ? PomodoroStatus.paused : PomodoroStatus.running,
              ),
        );
      }),
    );
  }
}
