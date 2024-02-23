import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/global_widgets/block_button_widget.dart';
import '../../../utils/global_widgets/gradient_block_button_widget.dart';
import '../controllers/onboard_controller.dart';
import '../widgets/page_indicator_widget.dart';
import '../widgets/slides_title_widget.dart';

class OnBoardScreen extends GetView<OnBoardController> {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Get.theme.colorScheme.primary),
          child: Obx(() {
            return Column(
              children: [
                SizedBox(
                  height: context.height * 0.8,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.onPageChange(index);
                    },
                    children: <Widget>[
                      SlideTileWidget(
                        imagePath: controller.mySlides[0].getImageAssetPath()!,
                        title: controller.mySlides[0].getTitle()!,
                        desc: controller.mySlides[0].getDesc()!,
                      ),
                      SlideTileWidget(
                        imagePath: controller.mySlides[1].getImageAssetPath()!,
                        title: controller.mySlides[1].getTitle()!,
                        desc: controller.mySlides[1].getDesc()!,
                      ),
                      SlideTileWidget(
                        imagePath: controller.mySlides[2].getImageAssetPath()!,
                        title: controller.mySlides[2].getTitle()!,
                        desc: controller.mySlides[2].getDesc()!,
                      )
                    ],
                  ),
                ),
                Container(
                  height: context.height * 0.2,
                  width: context.width,
                  color: Get.theme.colorScheme.secondary,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 3; i++)
                              i == controller.slideIndex.value
                                  ? const CustomPageIndicatorWidget(
                                      isCurrentPage: true,
                                    )
                                  : const CustomPageIndicatorWidget(
                                      isCurrentPage: false),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          BlockButtonWidget(
                            onPressed: () async {
                              Get.offAndToNamed(Routes.dashBoard);
                            },
                            color: Colors.white,
                            text: Text(
                              "Skip".tr,
                              style: TextStyle(
                                  color: Get.theme.colorScheme.primary),
                            ),
                          ),
                          GradientBlockButtonWidget(
                            radius: 100,
                            onPressed: () async {
                              if (controller.slideIndex.value != 2) {
                                controller.pageController?.animateToPage(
                                    controller.slideIndex.value + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              } else {
                                Get.offAndToNamed(Routes.dashBoard);
                              }
                            },
                            color: Get.theme.colorScheme.tertiary,
                            text: Text(
                              controller.slideIndex.value != 2
                                  ? "Next".tr
                                  : "Explore".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            );
          })),
      // bottomSheet:
    );
  }
}
