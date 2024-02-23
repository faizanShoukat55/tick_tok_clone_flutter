import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';

class CircularLoadingWidget extends StatefulWidget {
  final double? height;
  final ValueChanged<void>? onComplete;
  final String? onCompleteText;

  const CircularLoadingWidget(
      {super.key, this.height, this.onComplete, this.onCompleteText});

  @override
  State<StatefulWidget> createState() {
    return _CircularLoadingWidgetState();
  }
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 80,
            width: 80,
            decoration: Ui.getProgressBoxDecoration(),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            )));
  }
}
