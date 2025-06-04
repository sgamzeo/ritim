part of '../pomodoro_view.dart';

class _RemainingTimeWidget extends BaseGetView<PomodoroController> {
  const _RemainingTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        controller.formatTime(controller.remainingTime.value),
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
      ),
    );
  }
}
