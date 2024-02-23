import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class CircularAssetImage extends StatelessWidget {
  final String profilePhoto;
  final double height;
  final double width;
  final String description;

  const CircularAssetImage({super.key, required this.profilePhoto, required this.height, required this.width,required this.description});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(
              1,
            ),
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(color: Get.theme.colorScheme.tertiary),
                borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(profilePhoto),
            )),
        Center(
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        )
      ],
    ).paddingOnly(right: 16);
  }
}
