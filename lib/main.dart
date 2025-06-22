import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ritim/feature/components/custom_button_controller.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_view.dart';
import 'package:ritim/product/config/app_views.dart';
import 'package:ritim/product/config/theme.dart';
import 'package:ritim/product/localization/localization_delegates.dart';
import 'package:ritim/product/localization/localization_service.dart';
import 'package:ritim/product/services/cache_box_service.dart';
import 'package:ritim/product/services/getx_manager.dart';

void main() async {
  await CacheBoxService.initBoxes();
  await GetxManager.setupServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: AppViews.routes,
          initialRoute: AppViews.initial,
          translations: AppLanguages(),
          locale: Get.find<LocalizationService>().getLocale(),
          theme: ThemeManager.lightTheme,
        );
      },
    );
  }
}
