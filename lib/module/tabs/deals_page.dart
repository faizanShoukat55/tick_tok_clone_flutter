import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      color: tab2BgColor,
        height: size.height,
        width: size.width,
        child: const Center(child: Text("Deals Page",style: TextStyle(color: Colors.white),)));
  }
}
