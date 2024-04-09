import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textfield extends StatelessWidget {
  const textfield(
      {super.key,
      this.controller,
      required this.prefixIcon,
      required this.lable,
      required this.keypordtype});
  final TextEditingController? controller;
  final IconData prefixIcon;
  final String lable;
  final TextInputType keypordtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.primary_containerColor,
          suffix: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          prefixIcon: Icon(prefixIcon, color: AppColors.primary_containerColor),
          label: Text(
            lable,
            style: TextStyle(
                color: AppColors.primary_containerColor,
                fontWeight: FontWeight.bold),
          ), // Use labelText instead of label
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3.0.w, // Adjusted width to 8.0
              color: AppColors.tertiaryColor,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
        keyboardType: keypordtype,
      ),
    );
  }
}
