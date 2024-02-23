import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/custom_colors.dart';
import '../controller/dashboard_controller.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backGroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int)? onChange;
  final int currentIndex;

  const CustomBottomNavigationBar(
      {super.key,
      required this.backGroundColor,
      this.itemColor = primaryDarkColor,
      this.currentIndex = 0,
      required this.children,
      this.onChange});

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }

  @override
  void initState() {
    super.initState();
    Get.put(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: Platform.isIOS ? 20 : 0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: widget.backGroundColor)),
        color: widget.backGroundColor,

      ),
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.children.map((item) {
              var color = item.color ?? widget.itemColor;
              var icon = item.icon;
              var assetIcon = item.assetIcon;
              var label = item.label;
              int index = widget.children.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _changeIndex(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 2
                          ? SvgPicture.asset(
                              assetIcon,
                              height: 40,
                              width: 50,
                            )
                          : SvgPicture.asset(assetIcon,
                              height: index == 2 ? 40 : 24,
                              width: index == 2 ? 50 : 24,
                              color:widget.currentIndex == index
                                  ? color
                                  : Colors.white.withOpacity(0.8) ),
                      Visibility(
                        visible: index == 2 ? false : true,
                        child: Text(
                          label ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: widget.currentIndex == index
                                  ? color
                                  : Colors.white.withOpacity(0.8)
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const Divider(thickness: 0.1,),
        ],
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String assetIcon;
  final String label;
  final Color? color;

  CustomBottomNavigationItem(
      {required this.icon,
      required this.assetIcon,
      required this.label,
      this.color});
}
