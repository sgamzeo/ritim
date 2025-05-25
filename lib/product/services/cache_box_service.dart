import 'package:ritim/product/base/base_getx_service.dart';
import 'package:ritim/product/constants/get_storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class CacheBoxService extends BaseGetxService {
  static final languageBox = GetStorage(GetStorageKeys.languageBoxKey);

  static Future<void> initBoxes() async {
    await GetStorage.init(GetStorageKeys.languageBoxKey);
  }
}
