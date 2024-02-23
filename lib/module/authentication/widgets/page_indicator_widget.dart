import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageIndicatorWidget extends StatelessWidget {
  final bool isCurrentPage;
  const CustomPageIndicatorWidget({super.key, required this.isCurrentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? context.theme.colorScheme.tertiary
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
