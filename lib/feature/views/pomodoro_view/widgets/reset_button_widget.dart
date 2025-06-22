part of '../pomodoro_view.dart';

class _ResetButtonWidget extends BaseGetView<PomodoroController> {
  const _ResetButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        text: LocalizationKeys.resetTextKey.tr,
        onTap: () => controller.controlTimer(PomodoroStatus.initial),
      ),
    );
  }
}
