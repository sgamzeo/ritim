import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritim/feature/components/custom_button.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_controller.dart';
import 'package:ritim/product/base/base_get_view.dart';
import 'package:ritim/product/base/base_stateless_widget.dart';
import 'package:ritim/product/constants/enums.dart';
import 'package:ritim/product/utils/extensions.dart';

part 'widgets/remaining_time_widget.dart';
part 'widgets/start_stop_button_widget.dart';
part 'widgets/reset_button_widget.dart';

class PomodoroView extends BaseStatelessWidget {
  final PomodoroController controller = Get.put(PomodoroController());

  PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
                height: Get.height * controller.progress,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      controller.progress.toClampedAlpha(Colors.green),
                      (controller.progress * 0.6).toClampedAlpha(Colors.green),
                      (controller.progress * 0.3).toClampedAlpha(Colors.green),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              );
            },
          ),

          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _RemainingTimeWidget(),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _StartStopButtonWidget()),
                        SizedBox(width: 16.w),
                        Expanded(child: _ResetButtonWidget()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
