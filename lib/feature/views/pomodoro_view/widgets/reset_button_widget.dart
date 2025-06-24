part of '../pomodoro_view.dart';

class _ResetButtonWidget extends BaseGetView<PomodoroController> {
  const _ResetButtonWidget();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: LocalizationKeys.resetTextKey.tr,
      onTap: () => controller.controlTimer(PomodoroStatus.initial),
      controllerTag: 'resetButton',
    );
  }
}
