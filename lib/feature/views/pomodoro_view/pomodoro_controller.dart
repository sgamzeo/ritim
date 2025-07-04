import 'package:get/get.dart';
import 'package:ritim/product/base/base_getx_controller.dart';
import 'package:ritim/product/constants/enums.dart';
import 'package:ritim/product/helpers/audio_player_helper.dart';
import 'package:ritim/product/services/pomodoro_timer/session_timer_service.dart';
import 'package:ritim/product/utils/extensions.dart';

class PomodoroController extends BaseGetxController {
  PomodoroController({required this.timerService});

  final SessionTimerService timerService;

  Rx<Duration> get remainingTime => timerService.state.remainingTime;
  Rx<PomodoroStatus> get timerStatus => timerService.state.status;

  String get formattedTime => remainingTime.value.toMMSS();

  @override
  void onInit() {
    super.onInit();
    ever(timerStatus, AudioPlayerHelper.handleStatus);
  }

  void start() => timerService.start();
  void pause() => timerService.pause();
  void reset() => timerService.reset();

  @override
  void onClose() {
    timerService
        .onClose(); // optional, timerService bir GetxService olduğu için genelde kapatılmaz
    super.onClose();
  }
}
