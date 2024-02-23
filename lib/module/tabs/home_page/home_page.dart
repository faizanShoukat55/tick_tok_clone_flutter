import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tick_tok/module/tabs/home_page/controller/home_page_controller.dart';
import 'package:tick_tok/utils/custom_colors.dart';
import 'package:tick_tok/utils/global_widgets/gradient_block_button_widget.dart';
import 'package:tick_tok/utils/images_provider.dart';

import '../../../utils/global_widgets/circular_loading_widget.dart';
import '../../authentication/widgets/page_indicator_widget.dart';
import '../../widgets/circle_animation.dart';
import '../../widgets/circle_buttons.dart';
import '../../widgets/custom_scroll_indicator.dart';
import '../../widgets/video_player_item.dart';
import '../../widgets/circular_asset_image.dart';
import '../../widgets/circular_network_image.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: context.width,
            height: context.height,
            child: homePage(controller)));
  }

  Widget homePage(HomePageController controller) {
    return Obx(() => PageView.builder(
          itemCount: controller.homePosts.length,
          //itemCount: 3,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            // final data = videoController.videoList[index];
            var item = controller.homePosts[index];
            return Stack(
              children: [
                /// Media and page indicator
                PageView.builder(
                    itemCount: item.images!.length,
                    scrollDirection: Axis.horizontal,
                    controller: PageController(),
                    onPageChanged: (horizontalIndex) {
                      controller.onHorizontalPageChange(horizontalIndex);
                    },
                    itemBuilder: (horizontalContext, horizontalIndex) {
                      // print("OnPageChange $horizontalIndex");
                      return Stack(
                        children: [
                          horizontalIndex == 0
                              ? VideoPlayerItem(
                                  videoUrl:
                                      item.images![horizontalIndex].image ?? "")
                              : CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      item.images?[horizontalIndex].image ?? "",
                                  placeholder: (context, url) => Image.asset(
                                    ImagesPath.imgGif,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                          child: Icon(Icons.error_outline)),
                                ),

                          SizedBox(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                CircularAssetImage(
                                    profilePhoto: ImagesPath.addCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Add Listing"),
                                CircularAssetImage(
                                    profilePhoto: ImagesPath.searchCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Search"),
                                CircularAssetImage(
                                    profilePhoto:
                                        ImagesPath.notificationCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Notifications"),
                                CircularAssetImage(
                                    profilePhoto:
                                        ImagesPath.electronicsCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Electronics"),
                                CircularAssetImage(
                                    profilePhoto:
                                        ImagesPath.appliancesCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Appliances"),
                                CircularAssetImage(
                                    profilePhoto: ImagesPath.mobileCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Mobiles"),
                                CircularAssetImage(
                                    profilePhoto: ImagesPath.homeCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Home"),
                                CircularAssetImage(
                                    profilePhoto:
                                        ImagesPath.kitchenCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Kitchen"),
                                CircularAssetImage(
                                    profilePhoto: ImagesPath.sonyCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Sony"),
                                CircularAssetImage(
                                    profilePhoto:
                                        ImagesPath.samsungCategoryIcon,
                                    height: 48,
                                    width: 48,
                                    description: "Samsung"),
                              ],
                            ).paddingOnly(left: 24, top: 24),
                          ),

                          ///Page Indicator
                          Positioned(
                            bottom: 20,
                            left: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (int i = 0; i < item.images!.length; i++)
                                  i == horizontalIndex
                                      ? const CustomScrollIndicatorWidget(
                                          isCurrentPage: true,
                                        )
                                      : const CustomScrollIndicatorWidget(
                                          isCurrentPage: false),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),

                ///Icons, name and rest of the details without page indicator
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    // "MacBook Air 2013",
                                    item.postTitle ?? "",
                                    style: Get.textTheme.displayMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "AED ${item.price}",
                                    style: Get.textTheme.displayLarge?.copyWith(
                                        color: orangeColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    //"Lorem ipsum dolor sit amet, consectetur adipiscing elit... #Lorem #ipsum #amet",
                                    item.description ?? "",
                                    maxLines: 2,
                                    style: Get.textTheme.displaySmall
                                        ?.copyWith(fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const CircularNetworkImage(
                                          profilePhoto:
                                              "https://flagpedia.net/data/flags/w2560/ae.jpg",
                                          height: 24,
                                          width: 24),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        // "Dubai, United Arab Emirates",
                                        item.country ?? "",
                                        style: Get.textTheme.displaySmall
                                            ?.copyWith(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GradientBlockButtonWidget(
                                    radius: 8,
                                    onPressed: () async {},
                                    color: Get.theme.colorScheme.tertiary,
                                    text: Text(
                                      "Visit Website".tr,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     for (int i = 0; i < item.images!.length; i++)
                                  //       i == controller.horizontalIndex.value
                                  //           ? const CustomScrollIndicatorWidget(
                                  //               isCurrentPage: true,
                                  //             )
                                  //           : const CustomScrollIndicatorWidget(
                                  //               isCurrentPage: false),
                                  //   ],
                                  // ),
                                ],
                              ).paddingAll(4),
                            ),
                          ),

                          /// right side menus
                          Container(
                              width: 70,
                              margin: const EdgeInsets.only(top: 0, bottom: 50),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleButtons(
                                      imagePath: ImagesPath.offerIcon,
                                      description: "${item.offers}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleButtons(
                                      imagePath: ImagesPath.favoriteIcon,
                                      description: "${item.likes}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleButtons(
                                      imagePath: ImagesPath.commentIcon,
                                      description: "${item.comments}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleButtons(
                                      imagePath: ImagesPath.shareIcon,
                                      description: "${item.shares}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleAnimation(
                                      child: CircularNetworkImage(
                                          profilePhoto: item.profileImage ?? "",
                                          height: 48,
                                          width: 48)),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

// buildCircularNetworkImage(String profilePhoto, double height, double width) {
//   return SizedBox(
//     width: width,
//     height: height,
//     child: Column(
//       children: [
//         Container(
//             padding: const EdgeInsets.all(1),
//             width: width,
//             height: height,
//             decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Colors.grey,
//                     Colors.white,
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(25)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: Image(
//                 image: NetworkImage(profilePhoto),
//                 fit: BoxFit.fill,
//               ),
//             ))
//       ],
//     ),
//   );
// }
//
// buildCircularAssetImage(
//     String photo, double height, double width, String description) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//           // margin: const EdgeInsets.only(right: 16),
//           padding: const EdgeInsets.all(
//             1,
//           ),
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//               border: Border.all(color: Get.theme.colorScheme.tertiary),
//               borderRadius: BorderRadius.circular(25)),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(25),
//             child: Image.asset(photo),
//           )),
//       Center(
//         child: Text(
//           description,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.white,
//           ),
//         ),
//       )
//     ],
//   ).paddingOnly(right: 16);
// }
}
