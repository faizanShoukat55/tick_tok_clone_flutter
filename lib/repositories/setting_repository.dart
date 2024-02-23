

import 'package:get/get.dart';
import '../providers/json_data_provider.dart';
import '../models/setting_model.dart';

class SettingRepository {
  JsonApiClient? _jsonApiClient;

  SettingRepository() {
    _jsonApiClient = Get.find<JsonApiClient>();
  }

  Future<Setting> get() {
    return _jsonApiClient!.getAppSettings();
  }

}
