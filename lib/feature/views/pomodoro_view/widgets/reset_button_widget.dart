part of '../pomodoro_view.dart';

class _ResetButtonWidget extends BaseGetView<PomodoroController> {
  const _ResetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(text: 'Sıfırla', onTap: controller.resetTimer),
    );
  }
}
