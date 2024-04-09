import 'package:satbark/constants.dart';
import 'package:satbark/home_Screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/models/produc_model.dart';
import 'package:satbark/widgets/productWidget.dart';

class Store extends StatelessWidget {
  const Store({super.key});

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
          "Store",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 190.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: item(
                          myprod: Product(
                        img2: "assets/Images/headphone.png",
                        img3: "assets/Images/powerBank.png",
                        img1: "assets/Images/headphone.png",
                        name: "phone",
                        details: """Mobile Phone Accessories""",
                        prodPrice: 322,
                        oldprodPrice: 400,
                        // category: "cat",
                      )),
                      onTap: () {
                        Navigator.pushNamed(context, '/category');
                      },
                    );
                  },
                )),
            Container(
                height: 190.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ItemCircular(),
                      onTap: () {
                        Navigator.pushNamed(context, '/ItemDetails');
                      },
                    );
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Expanded(child: item3()), Expanded(child: item3())],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCircular extends StatelessWidget {
  const ItemCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 55,
        backgroundColor: AppColors.quaternaryColor,
        child: CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.tertiaryColor,
            backgroundImage: AssetImage("assets/Images/charger.png")),
      ),
    );
  }
}

class item3 extends StatelessWidget {
  const item3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // width: 150.w,
      // color: Colors.red,
      height: MediaQuery.sizeOf(context).height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return
              // width: 50.w,
              // color: AppColors.tertiaryColor,
              item(
                  myprod: Product(
            img2: "assets/Images/headphone.png",
            img3: "assets/Images/powerBank.png",
            img1: "assets/Images/headphone.png",
            name: "phone",
            details: """Mobile Phone Accessories""",
            prodPrice: 322,
            oldprodPrice: 400,
            // category: "cat",
          ));
        },
        itemCount: 5,
      ),
    );
  }
}


/*
ListTile(
              leading: Container(
                //width: 70,
                //height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Images/headphone.png"),
                        fit: BoxFit.fill)),
              ),
              title: Text("product name"),
              // dense: true,
              trailing: Text("77 \$"),
            ),

*/