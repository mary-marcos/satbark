import 'package:satbark/constants.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Welcome_Screen extends StatelessWidget {
  Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://i.imgur.com/zZR7pS9.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonSolid(
                      b_color: AppColors.primary_containerColor,
                      text: "sign up",
                      ontap: () {
                        Navigator.pushNamed(context, '/SignUP');
                      }),
                  button_border(
                      b_color: AppColors.primary_containerColor,
                      text: "sign in",
                      ontap: () {
                        Navigator.pushNamed(context, '/SignIn');
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
