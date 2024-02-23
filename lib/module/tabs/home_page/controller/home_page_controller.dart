import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tick_tok/models/home_posts_model.dart';
import 'package:tick_tok/repositories/home_repository.dart';

import '../../../../utils/ui.dart';

class HomePageController extends GetxController{

  HomeRepository? _homeRepo;
  final loading = false.obs;
  final homePosts = <Posts>[].obs;

  PageController? horizontalPageController=PageController();
  var horizontalIndex = 0.obs;
  HomePageController(){
    _homeRepo=HomeRepository();
  }

  void onHorizontalPageChange(int index){
    horizontalIndex.value=index;
  }

  @override
  void onInit() {
    super.onInit();
    getHistory();
  }

  Future getHistory() async {
    try {
      loading.value = true;
      homePosts.value = (await _homeRepo?.homePosts())!;
    } catch (e) {
      Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    } finally {
      loading.value = false;
    }
  }

}

