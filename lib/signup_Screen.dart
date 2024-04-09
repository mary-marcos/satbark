import 'package:firebase_core/firebase_core.dart';
import 'package:satbark/businesslogic/firebase/Authonticate.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:satbark/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUP extends StatefulWidget {
  SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //color: AppColors.tertiaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5.w.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      color: AppColors.secondaryColor),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 120.w,
                  child: Text("""create account""",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                          color: AppColors.primary_containerColor,
                          fontSize: 30)),
                ),
              ),
              SizedBox(
                height: 80.h,
                child: textfield(
                    controller: emailcontroller,
                    prefixIcon: Icons.email,
                    lable: "Email",
                    keypordtype: TextInputType.emailAddress),
              ),
              SizedBox(
                height: 80.h,
                child: textfield(
                    controller: passwordcontroller,
                    prefixIcon: Icons.password,
                    lable: "password",
                    keypordtype: TextInputType.text),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  // height: .h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonSolid(
                            b_color: AppColors.primary_containerColor,
                            text: "create account",
                            ontap: () {
                              try {
                                Authontication.Createuser(
                                    emailcontroller.text.trim(),
                                    passwordcontroller.text.trim());

                                Navigator.pushNamed(context, '/SignInfo');
                              } catch (e) {
                                print("--------------------$e-----------");
                              }
                            }),
                        button_border(
                            b_color: AppColors.primary_containerColor,
                            text: "sign up with Google",
                            ontap: () {})
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 38.h,
                child: Row(
                  children: [
                    Text("already have account?",
                        style: TextStyle(fontSize: 15.sp)),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignIn');
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
