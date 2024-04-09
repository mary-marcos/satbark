import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              )),
          backgroundColor: AppColors.secondaryColor,
          title: Text(
            "Wish list",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("User")
                .doc(auth.currentUser!.uid)
                .collection("Wishlist")
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: AppColors.primaryColor,

                      splashColor: AppColors.quaternaryColor,
                      leading: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            // color: AppColors.quaternaryColor,
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data!.docs[index]["img1"]),
                                fit: BoxFit.fill)),
                      ),
                      title: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[index]["neme"],
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Text(
                            "${snapshot.data!.docs[index]["prodPrice"]} \$",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ],
                      ),
                      // dense: true,
                      trailing: IconButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/Wishlist');
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }));
  }
}



//Wishlist