import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/itemdetails.dart';
import 'package:satbark/models/category.dart';
import '../models/produc_model.dart';

class item extends StatelessWidget {
  item({super.key, required this.myprod});
  Product myprod;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("--------${myprod.oldprodPrice}==========");

        Navigator.pushNamed(context, '/ItemDetails', arguments: {
          'Product': myprod,
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        //padding: EdgeInsets.all(40),
        // height: 10,
        width: 120.w,
        // color: Colors.amber,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  shape: ContinuousRectangleBorder(
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: SizedBox(
                    height: 150.h,
                    width: 120.w,
                  )),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    myprod.img1!,
                    //"assets/Images/wall.png",
                    //"assets/Images/headphone.png",
                    height: 100.h,
                    width: 200.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  myprod.name!,
                  //"headPHone",
                  style: TextStyle(fontSize: 20.sp),
                ),
                Text(
                  "${myprod.prodPrice}\$",
                  style: TextStyle(fontSize: 20.sp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Itemcategory extends StatelessWidget {
  Itemcategory({super.key, required this.myprod});
  CategoryModel myprod;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/category', arguments: {
          'Product': myprod,
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        //padding: EdgeInsets.all(40),
        // height: 10,
        width: 120.w,
        // color: Colors.amber,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                  elevation: 15,
                  borderOnForeground: true,
                  shape: ContinuousRectangleBorder(
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: SizedBox(
                    height: 150.h,
                    width: 120.w,
                  )),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    myprod.img!,
                    //"assets/Images/wall.png",
                    //"assets/Images/headphone.png",
                    height: 100.h,
                    // width: 200.w,
                    scale: 2,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  myprod.name!,
                  //"headPHone",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
