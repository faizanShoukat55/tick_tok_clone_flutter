import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tick_tok/module/dashboard/controller/dashboard_controller.dart';
import 'package:tick_tok/utils/images_provider.dart';

import '../../../utils/custom_colors.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: primaryDarkColor,
        statusBarBrightness: Brightness.dark,
        statusBarColor: secondaryDarkColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,

        // Change this to your desired color
      ),
    );
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: controller.currentPage,
          bottomNavigationBar: CustomBottomNavigationBar(
            backGroundColor: context.theme.colorScheme.primary,
            itemColor: context.theme.colorScheme.tertiary,
            currentIndex: controller.currentIndex.value,
            onChange: (index) {
              controller.changePage(index);
            },
            children: [
              CustomBottomNavigationItem(
                icon: Icons.numbers,
                assetIcon: ImagesPath.homeIcon,
                label: "Home",
              ),
              CustomBottomNavigationItem(
                icon: Icons.sms,
                assetIcon: ImagesPath.discoverIcon,
                label: "Discover",
              ),
              CustomBottomNavigationItem(
                icon: Icons.calendar_month,
                assetIcon: ImagesPath.addIcon,
                label: "",
              ),
              CustomBottomNavigationItem(
                icon: Icons.settings,
                assetIcon: ImagesPath.dealsIcon,
                label: "Deals",
              ),
              CustomBottomNavigationItem(
                icon: Icons.settings,
                assetIcon: ImagesPath.profileIcon,
                label: "Profile",
              ),
            ],
          ),
        ),
      );
    });
  }
}
