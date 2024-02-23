import 'package:get/get.dart';
import 'package:tick_tok/module/dashboard/controller/dashboard_controller.dart';
import 'package:tick_tok/module/tabs/home_page/controller/home_page_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomePageController());
  }

}