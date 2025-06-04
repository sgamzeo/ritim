part of '../pomodoro_view.dart';

class _StartStopButtonWidget extends BaseGetView<PomodoroController> {
  const _StartStopButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => CustomButton(
          onTap:
              controller.isRunning.value
                  ? controller.pauseTimer
                  : controller.startTimer,
          text: controller.isRunning.value ? 'Duraklat' : 'Başlat',
        ),
      ),
    );
  }
}
