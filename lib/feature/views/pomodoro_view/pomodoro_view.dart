import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritim/feature/components/custom_button.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_controller.dart';
import 'package:ritim/product/base/base_get_view.dart';
import 'package:ritim/product/base/base_stateless_widget.dart';

part 'widgets/remaining_time_widget.dart';
part 'widgets/start_stop_button_widget.dart';
part 'widgets/reset_button_widget.dart';

class PomodoroView extends BaseStatelessWidget {
  final PomodoroController controller = Get.put(PomodoroController());

  PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pomodoro Timer')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _RemainingTimeWidget(),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StartStopButtonWidget(),
                  SizedBox(width: 20.h),
                  _ResetButtonWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
