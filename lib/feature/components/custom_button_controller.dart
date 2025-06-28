import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomButtonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  final scale = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      lowerBound: 0.5,
      upperBound: 1.0,
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutBack,
    );

    animationController.addListener(() {
      scale.value = scaleAnimation.value;
    });

    animationController.value = 1.0;
  }

  void onTapDown() {
    animationController.reverse();
  }

  void onTapUp() {
    animationController.forward();
  }

  void onTapCancel() {
    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
