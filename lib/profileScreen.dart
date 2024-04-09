import 'package:satbark/businesslogic/firebase/fireStore.dart';
import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late usermodel curuser;
  Future<void> getuser() async {
    curuser = await FireStore.getCurrent();
    print("${curuser.name}");
    setState(() {});
    // Rebuild the widget after user data is fetched
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    if (curuser == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editprofile');
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/Images/profile.png"),
              radius: 60,
            ),
            Text(
              "${curuser.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${curuser.phone}"),
            Container(
              height: 140.h,
              width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    AppColors.quaternaryColor,
                    AppColors.tertiaryColor,
                  ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "age",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text("${curuser.age}")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "total orders",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text("6")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text("114\$")
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
