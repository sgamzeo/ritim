import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return GetMaterialApp(
      translations: AppLanguages(),
      locale: Get.find<LocalizationService>().getLocale(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(),
    );
  }
}
