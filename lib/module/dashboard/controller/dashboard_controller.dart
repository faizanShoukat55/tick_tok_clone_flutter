import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tick_tok/module/tabs/deals_page.dart';
import 'package:tick_tok/module/tabs/discover_page.dart';
import 'package:tick_tok/module/tabs/profile_page.dart';
import '../../tabs/home_page/home_page.dart';

class DashboardController extends GetxController {
  final currentIndex = 0.obs;

  List<Widget> pages = [
    const HomePage(),
    const DiscoverPage(),
    const DiscoverPage(),
    const DealsPage(),
    const ProfilePage(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /// change page in route
  Future<void> changePage(int index) async {
    currentIndex.value = index;
  }
}
