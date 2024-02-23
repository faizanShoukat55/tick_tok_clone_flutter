import 'package:flutter/material.dart';
import 'package:tick_tok/utils/custom_colors.dart';

class CustomScrollIndicatorWidget extends StatelessWidget {
  final bool isCurrentPage;

  const CustomScrollIndicatorWidget({super.key, required this.isCurrentPage});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height:  10.0,
      width: isCurrentPage ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? orangeColor
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
