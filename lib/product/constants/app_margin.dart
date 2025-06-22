import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMargin {
  AppMargin._();

  static EdgeInsets get small => EdgeInsets.all(8.w);
  static EdgeInsets get medium => EdgeInsets.all(16.w);
  static EdgeInsets get large => EdgeInsets.all(24.w);

  static EdgeInsets get buttonMargin => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get cardMargin => EdgeInsets.all(12.w);
  static EdgeInsets get listItemMargin => EdgeInsets.only(bottom: 10.h);
}
