import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ritim/product/localization/localization_service.dart';
import 'package:ritim/product/services/cache_service.dart';
import 'package:ritim/product/services/pomodoro_timer/session_timer_service.dart';

class GetxManager {
  static Future<void> setupServices() async {
    Get.put(Dio(), permanent: true);
    Get.put(Logger(), permanent: true);
    Get.put(CacheService(), permanent: true);
    await Get.put(LocalizationService(), permanent: true).initLocale();
    Get.lazyPut<SessionTimerService>(
      () => SessionTimerService(totalDuration: Duration(seconds: 5)),
      fenix: true,
    );
  }
}
