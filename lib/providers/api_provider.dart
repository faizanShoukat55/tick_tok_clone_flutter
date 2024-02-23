import 'package:get/get.dart';

import '../services/global_service.dart';

mixin ApiClient {
  final globalService = Get.find<GlobalService>();
  String? baseUrl;

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return '${baseUrl!}/$path';
    }
    return baseUrl! + path;
  }

  String getApiBaseUrl(String path) {
    String? apiPath = globalService.global.value.apiPath;
    if (path.startsWith('/')) {
      return getBaseUrl(apiPath!) + path.substring(1);
    }
    return getBaseUrl(apiPath!) + path;
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse(getApiBaseUrl(path));
  }

  Uri getBaseUri(String path) {
    return Uri.parse(getBaseUrl(path));
  }



  String getFileBaseUrl(String path) {
    if (path.startsWith('/')) {
      return getBaseUrl("") + path.substring(1);
    }
    return getBaseUrl("") + path;
  }
}
