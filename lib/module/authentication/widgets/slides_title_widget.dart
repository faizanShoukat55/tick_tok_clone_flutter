import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SlideTileWidget extends StatelessWidget {
  final String? imagePath, title, desc;

  const SlideTileWidget({super.key, this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Image.asset(
            imagePath ?? "",
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            color: Get.theme.colorScheme.secondary,
            child: Column(
              children: [
                SizedBox(
                  //height: 20,
                  height: 0.035 * context.height,
                ),
                Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.displayLarge,
                ),
                SizedBox(
                  //height: 20,
                  height: 0.035 * context.height,
                ),
                Text(
                  desc ?? "",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
