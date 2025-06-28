part of '../pomodoro_view.dart';

class _RemainingTimeWidget extends BaseGetView<PomodoroController> {
  const _RemainingTimeWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScaleFactorAutoSizeText(
        text: controller.formattedTime,
        style: theme.primaryTextTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontFamily: 'Autowide',
          shadows: [_buildShadow()],
        ),
      ),
    );
  }

  Shadow _buildShadow() {
    return Shadow(
      blurRadius: 8.0,
      color: AppColors.primaryColor,
      offset: Offset(2.0, 2.0),
    );
  }
}
