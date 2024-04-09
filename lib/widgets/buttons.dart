import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class buttonSolid extends StatelessWidget {
  buttonSolid(
      {required this.b_color,
      required this.text,
      required this.ontap,
      this.f_color = AppColors.primaryColor,
      super.key});
  final Color b_color;
  Color f_color;

  String text;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(60.w, 45.h),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          foregroundColor: f_color,
          backgroundColor: b_color),
    );
  }
}

class button_border extends StatelessWidget {
  button_border(
      {required this.b_color,
      required this.text,
      required this.ontap,
      super.key});
  final Color b_color;

  String text;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(60.w, 45.h),
        shape: ContinuousRectangleBorder(
            side: BorderSide(color: b_color, width: 4.w),
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        foregroundColor: b_color,
        // backgroundColor: AppColors.primary_containerColor
      ),
    );
    ;
  }
}
