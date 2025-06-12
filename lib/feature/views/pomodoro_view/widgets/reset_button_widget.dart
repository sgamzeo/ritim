part of '../pomodoro_view.dart';

class _ResetButtonWidget extends BaseGetView<PomodoroController> {
  const _ResetButtonWidget();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Sıfırla',
      onTap: () => controller.controlTimer(PomodoroStatus.initial),
      color: Colors.grey.shade600,
      textColor: Colors.white,
      borderRadius: 30,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    );
  }
}
