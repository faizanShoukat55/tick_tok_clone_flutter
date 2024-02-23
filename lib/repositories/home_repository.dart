import 'package:get/get.dart';
import '../models/home_posts_model.dart';
import '../providers/network_client_provider.dart';

///Home Repository (APIs)
class HomeRepository {
  NetworkApiClient? _networkApiClient;

  HomeRepository() {
    _networkApiClient = Get.find<NetworkApiClient>();
  }

  ///History Module
  Future<List<Posts>?>? homePosts() {
    return _networkApiClient?.homePosts();
  }
}
