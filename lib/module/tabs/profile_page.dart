import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      color: tab3BgColor,
        height: size.height,
        width: size.width,
        child: const Center(child: Text("Profile Page",style: TextStyle(color: Colors.white),)));
  }
}
