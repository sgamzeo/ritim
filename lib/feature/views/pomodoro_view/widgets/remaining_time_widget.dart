part of '../pomodoro_view.dart';

class _RemainingTimeWidget extends BaseGetView<PomodoroController> {
  const _RemainingTimeWidget();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) {
        return Text(
          controller.formattedTime,
          style: TextStyle(
            fontSize: 80.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF424242),
            fontFamily: 'Courier',
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Colors.black26,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
