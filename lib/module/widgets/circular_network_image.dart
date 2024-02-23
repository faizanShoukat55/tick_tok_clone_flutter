import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CircularNetworkImage extends StatelessWidget {
  final String profilePhoto;
  final double height;
  final double width;

  const CircularNetworkImage({super.key, required this.profilePhoto, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(1),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.fill,
                ),
              ))
        ],
      ),
    );
  }
}
