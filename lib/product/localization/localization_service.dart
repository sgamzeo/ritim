import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:ritim/product/constants/app_constants.dart';
import 'package:ritim/product/constants/get_storage_keys.dart';
import 'package:ritim/product/localization/language_model.dart';
import 'package:ritim/product/services/cache_box_service.dart';
import 'package:ritim/product/services/cache_service.dart';
import 'package:timezone/data/latest.dart' as tz;

class LocalizationService extends GetxService {
  final _cacheService = Get.find<CacheService>();

  late LanguageModel languageModel;

  Locale getLocale() {
    return _locale('tr', 'TR'); // sabit tr dönüyor
    //return _locale(languageModel.languageCode, languageModel.countryCode);
  }

  // kullanıcı dili değiştirdiğinde çağrılır
  Future<void> setLocale({required LanguageModel languageModel}) async {
    try {
      this.languageModel = languageModel;
      await Get.updateLocale(
        _locale(languageModel.languageCode, languageModel.countryCode),
      ); // dili günceller
      await setLanguage(languageModel); //cihazda kaydeder
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initLocale() async {
    try {
      var languageData = await getLanguage();
      if (languageData != null) {
        // daha önce kayıtlı bir dil var mı kontrol eder
        languageModel = languageData;
      } else {
        tz.initializeTimeZones(); // kayıtlı dil yok ise cihazin dilini kontrol eder. türkçe mi ingilizce mi karar verir. ona göre language model'i doldurur.
        var localeNameList = Platform.localeName.toString().split('_');
        if (localeNameList[0] == 'tr') {
          languageModel = AppConstants.languageModelTr;
        } else {
          languageModel = AppConstants.languageModelEn;
        }
      }
    } catch (e) {
      languageModel = AppConstants.languageModelEn;
    }
  }

  Future<bool> setLanguage(LanguageModel languageModel) async {
    //dili get storage'a kaydet
    try {
      var isSaved = await _cacheService.save(
        box: CacheBoxService.languageBox,
        key: GetStorageKeys.languageBoxKey,
        value: languageModel.toJson(),
      );
      return isSaved;
    } catch (e) {
      rethrow;
    }
  }

  Future<LanguageModel?> getLanguage() async {
    // dili getstorage'dan oku
    try {
      var data = await _cacheService.getData<Map<String, dynamic>>(
        box: CacheBoxService.languageBox,
        key: GetStorageKeys.languageBoxKey,
      );
      return LanguageModel.decoder(data);
    } catch (e) {
      rethrow;
    }
  }

  Locale _locale(String languageCode, String countryCode) {
    // dil ve ülke kodundan Locale nesnesi oluştur
    return (languageCode.isNotEmpty && countryCode.isNotEmpty)
        ? Locale(languageCode, countryCode)
        : Locale(
          AppConstants.languageModelEn.languageCode,
          AppConstants.languageModelEn.countryCode,
        );
  }

  bool get isEn {
    return languageModel.languageCode == 'en';
  }
}
