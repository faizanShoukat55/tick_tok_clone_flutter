import 'package:get/get.dart';
import 'package:tick_tok/module/authentication/controllers/onboard_controller.dart';
import 'package:tick_tok/module/tabs/home_page/controller/home_page_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(HomePageController(),permanent: true);

    Get.lazyPut<OnBoardController>(
          () => OnBoardController(),
    );
  }
}
