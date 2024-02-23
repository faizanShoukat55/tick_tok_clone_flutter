import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CircleButtons extends StatelessWidget {
  final String imagePath;
  final String description;

  const CircleButtons(
      {super.key, required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff347eb8),
                  Color(0xff3592be),
                  Color(0xff3591BE),
                  Color(0xff37afc6),
                  Color(0xff38bdca),
                  Color(0xff39D6D2),
                  Color(0xff39D7D2),
                  Color(0xff3AE3D6),
                  Color(0xff3AE3D6),
                  Color(0xff3AEAD8),
                  Color(0xff3AEAD8),
                ],
              ),
              borderRadius: BorderRadius.circular(25)),

          child: SvgPicture.asset(
            imagePath,
            color: Colors.white,
            height: 0,
            width: 1,
          ),

        ),

        const SizedBox(height: 7),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
