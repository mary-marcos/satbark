import 'package:satbark/constants.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:satbark/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height - 60.h,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/Images/profile.png"),
                radius: 60,
              ),
              textfield(
                  prefixIcon: Icons.person,
                  lable: "Full Name",
                  keypordtype: TextInputType.name),
              textfield(
                  prefixIcon: Icons.phone,
                  lable: "Phone Number",
                  keypordtype: TextInputType.number),
              textfield(
                  prefixIcon: Icons.people,
                  lable: "Age",
                  keypordtype: TextInputType.number),
            ],
          )),
        ),
      ),
    );
  }
}
