import 'package:satbark/businesslogic/firebase/fireStore.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:satbark/widgets/textField.dart';
import 'package:flutter/material.dart';

class SignInfo extends StatefulWidget {
  SignInfo({super.key});

  @override
  State<SignInfo> createState() => _SignInfoState();
}

class _SignInfoState extends State<SignInfo> {
  TextEditingController username = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController phonenum = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    age.dispose();
    phonenum.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/Images/profile.png"),
                radius: 60,
              ),
              textfield(
                  controller: username,
                  prefixIcon: Icons.person,
                  lable: "Full Name",
                  keypordtype: TextInputType.name),
              textfield(
                  controller: phonenum,
                  prefixIcon: Icons.phone,
                  lable: "Phone Number",
                  keypordtype: TextInputType.number),
              textfield(
                  controller: age,
                  prefixIcon: Icons.people,
                  lable: "Age",
                  keypordtype: TextInputType.number),
              buttonSolid(
                  f_color: AppColors.tertiaryColor,
                  b_color: AppColors.quaternaryColor,
                  text: "submit",
                  ontap: () {
                    try {
                      FireStore.AddCurrent(
                          username.text, age.text, phonenum.text);
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      print("---------------$e");
                    }
                  })
            ],
          )),
        ),
      ),
    );
  }
}
