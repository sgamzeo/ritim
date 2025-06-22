import 'package:get/get.dart';
import 'package:ritim/feature/components/custom_button_controller.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_controller.dart';

class PomodoroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PomodoroController>(() => PomodoroController());
    Get.lazyPut<CustomButtonController>(() => CustomButtonController());
  }
}
