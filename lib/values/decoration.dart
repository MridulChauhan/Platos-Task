import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/values/colors.dart';

class AppDecoration {
  static TextStyle appbarheadingdecoration = TextStyle(
    color: AppColors.appbarheadingclr,
    fontSize: ScreenUtil().setSp(20),
    fontWeight: FontWeight.bold,
  );
}
