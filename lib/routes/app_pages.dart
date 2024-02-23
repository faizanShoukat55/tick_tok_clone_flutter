import 'package:get/get.dart' show GetPage, Transition;
import 'package:tick_tok/module/authentication/binding/auth_binding.dart';

import 'package:tick_tok/module/authentication/views/onboard_screen.dart';
import '../module/dashboard/binding/dashboard_binding.dart';
import '../module/dashboard/view/dashboard.dart';
import 'app_routes.dart';

class AppPages {
   static const initial = Routes.onBoard;
  static final routes = [
    GetPage(
      name: Routes.onBoard,
      page: () => const OnBoardScreen(),
      binding: AuthBinding(),
    ),


    GetPage(
      name: Routes.dashBoard,
      page: () => const Dashboard(),
      binding: DashboardBinding(),
    ),




  ];
}
