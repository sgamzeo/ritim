import 'package:get/get.dart';

import 'package:ritim/feature/views/pomodoro_view/pomodoro_controller.dart';
import 'package:ritim/product/services/pomodoro_timer/session_timer_service.dart';

class PomodoroViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PomodoroController>(
      () => PomodoroController(timerService: Get.find<SessionTimerService>()),
    );
  }
}
