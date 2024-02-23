import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed});

  final Color color;
  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        disabledElevation: 0,
        elevation: 0,
        child: text,
      ),
    );
  }
}
