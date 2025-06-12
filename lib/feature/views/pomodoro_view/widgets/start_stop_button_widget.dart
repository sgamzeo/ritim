part of '../pomodoro_view.dart';

class _StartStopButtonWidget extends BaseGetView<PomodoroController> {
  const _StartStopButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final isRunning = controller.status.value == PomodoroStatus.running;

        return CustomButton(
          onTap:
              () => controller.controlTimer(
                isRunning ? PomodoroStatus.paused : PomodoroStatus.running,
              ),
          text: isRunning ? 'Duraklat' : 'Başlat',
        );
      }),
    );
  }
}
