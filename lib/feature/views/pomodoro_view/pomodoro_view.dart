import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritim/feature/components/custom_button.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_controller.dart';
import 'package:ritim/product/base/base_get_view.dart';
import 'package:ritim/product/components/scale_factor_autosize_text.dart';

import 'package:ritim/product/constants/app_colors.dart';
import 'package:ritim/product/constants/app_padding.dart';
import 'package:ritim/product/constants/enums.dart';
import 'package:ritim/product/localization/localization_keys.dart';

part 'widgets/remaining_time_widget.dart';
part 'widgets/start_stop_button_widget.dart';
part 'widgets/reset_button_widget.dart';

class PomodoroView extends BaseGetView<PomodoroController> {
  const PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppPadding.large,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _RemainingTimeWidget(),
              SizedBox(height: 40.h),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _StartStopButtonWidget()),
        SizedBox(width: 16.w),
        Expanded(child: _ResetButtonWidget()),
      ],
    );
  }
}
