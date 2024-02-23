import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      color: tab4BgColor,
        height: size.height,
        width: size.width,
        child: const Center(child: Text("Discover Page",style: TextStyle(color: Colors.white),)));
  }
}
