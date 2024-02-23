import 'package:get/get.dart';
import 'package:tick_tok/models/home_posts_model.dart';
import '../main.dart';
import 'api_path_provider.dart';
import 'api_provider.dart';
import 'package:dio/dio.dart' as dio;

/// APIs implementation provider
class NetworkApiClient extends GetxService with ApiClient {
  dio.Dio? _httpClient;
  dio.Options? _optionsNetwork;
  dio.Options? _optionsCache;

  NetworkApiClient() {
    baseUrl = globalService.global.value.laravelBaseUrl;

    dio.BaseOptions options = dio.BaseOptions(
        //baseUrl: "your base url",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30), // 60 seconds
        receiveTimeout: const Duration(seconds: 30) // 60 seconds
        );

    _httpClient = dio.Dio(options);
  }

  Future<NetworkApiClient> init() async {
    return this;
  }

  ///Posts
  Future<List<Posts>?> homePosts() async {
    Uri uri = getApiBaseUri(ApiPathProvider.postsUrl);
    Get.log(uri.toString());
    try {
      var response = await _httpClient?.postUri(uri);
      if (response!.statusCode == 200) {
        if (response.data['status'] == true) {
          return response.data['posts']
              .map<Posts>((obj) => Posts.fromJson(obj))
              .toList();
        } else {
          throw Exception(ApiPathProvider.genericExceptionMessage);
        }
      } else {
        throw Exception(ApiPathProvider.genericExceptionMessage);
      }
    } catch (e) {
      throw Exception(ApiPathProvider.genericExceptionMessage);
    }
  }
}
