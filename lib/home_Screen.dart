import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:satbark/businesslogic/firebase/fireStore.dart';
import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/models/category.dart';
import 'package:satbark/models/produc_model.dart';
import 'package:satbark/store.dart';
import 'package:satbark/widgets/productWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = [
      CategoryModel(
          img:
              "https://m.media-amazon.com/images/I/617FLls4p0L.__AC_SX300_SY300_QL70_FMwebp_.jpg",
          name: "mobiles"),
      CategoryModel(
          img:
              "https://m.media-amazon.com/images/I/81pTvWcR5ZL.__AC_SX300_SY300_QL70_FMwebp_.jpg",
          name: "cameras"),
      CategoryModel(
          img:
              "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yN18zZF9pbGx1c3RyYXRpb25fb2ZfYV9oZWFkcGhvbmVfY3V0ZV9jYXJ0b29uX181ZmNkYzU2My00ZGJhLTQ1MzEtODJlYy01YmY3ZjRmY2UyZmIucG5n.png",
          name: "headphones"),
      CategoryModel(
          img:
              "https://m.media-amazon.com/images/I/81WN3SJ-PRL.__AC_SX300_SY300_QL70_FMwebp_.jpg",
          name: "laptops")
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          "SATBARK",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Wishlist');
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 10.w,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/category');
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(
            width: 10.w,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Profile');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              height: 200.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Images/wall.png"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/store');
                        },
                        child: Container(
                          width: 180.w,
                          color: AppColors.quaternaryColor,
                          child: Row(
                            children: [
                              Text("go shopping"),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 35,
                                color: AppColors.primary_containerColor,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Text("categories"),
            Container(
                // height: 300.h,
                child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              //scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (BuildContext context, int index) {
                return Itemcategory(
                    myprod: CategoryModel(
                  img: category[index].img,

                  name: category[index].name,

                  // category: "cat",
                ));
              },
            )),
            Text("most ordered .."),
            Container(
                height: 190.h,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("most_ordered")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return item(
                              myprod: Product(
                            img2: snapshot.data!.docs[index]["img2"],
                            img3: snapshot.data!.docs[index]["img3"],
                            img1: snapshot.data!.docs[index]["img1"],
                            name: snapshot.data!.docs[index]["name"],
                            details: snapshot.data!.docs[index]["details"],
                            prodPrice: snapshot.data!.docs[index]["prodPrice"],
                            oldprodPrice: snapshot.data!.docs[index]
                                ["oldprodPrice"],
                            // category: "cat",
                          ));
                        },
                      );
                    }
                  },
                )
                
                ),
            Text("news"),
            Container(
                height: 190.h,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("newest")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return item(
                              myprod: Product(
                            img2: snapshot.data!.docs[index]["img2"],
                            img3: snapshot.data!.docs[index]["img3"],
                            img1: snapshot.data!.docs[index]["img1"],
                            name: snapshot.data!.docs[index]["name"],
                            details: snapshot.data!.docs[index]["details"],
                            prodPrice: snapshot.data!.docs[index]["prodPrice"],
                            oldprodPrice: snapshot.data!.docs[index]
                                ["oldprodPrice"],
                            // category: "cat",
                          ));
                        },
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
