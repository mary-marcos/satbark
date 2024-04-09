import 'package:satbark/businesslogic/firebase/Authonticate.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:satbark/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  child: Text("""Sign In""",
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
                            text: "signin",
                            ontap: () {
                              try {
                                Authontication.Signin(
                                    emailcontroller.text.trim(),
                                    passwordcontroller.text.trim());

                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } catch (e) {
                                print("--------------------$e-----------");
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
