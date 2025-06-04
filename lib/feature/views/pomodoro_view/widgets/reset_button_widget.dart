part of '../pomodoro_view.dart';

class ResetButtonWidget extends BaseGetView<PomodoroController> {
  const ResetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(text: 'Sıfırla', onTap: controller.resetTimer),
    );
  }
}
