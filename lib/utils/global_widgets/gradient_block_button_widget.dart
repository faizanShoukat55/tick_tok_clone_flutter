import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientBlockButtonWidget extends StatelessWidget {
  const GradientBlockButtonWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed,
      required this.radius});

  final Color color;
  final Widget text;
  final VoidCallback onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
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
          )),
      child: MaterialButton(
        onPressed: onPressed,
        disabledElevation: 0,
        elevation: 0,
        child: text,
      ),
    );
  }
}
