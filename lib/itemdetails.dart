import 'dart:developer';

import 'package:satbark/constants.dart';
import 'package:satbark/models/cartproduct.dart';
import 'package:satbark/models/produc_model.dart';
import 'package:satbark/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:satbark/businesslogic/firebase/fireStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({
    super.key,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late String? backimg;
  late final Product myprod;
  // late Product currentproduct;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    myprod = args?['Product'];
    backimg = myprod.img1;

    // currentproduct = myprod;
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.sizeOf(context).width,
              height: 230.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.tertiaryColor,
                  image: DecorationImage(image: NetworkImage(backimg!))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        FireStore.Addwishlist(
                          Product(
                              name: myprod.name,
                              img1: myprod.img1,
                              img2: myprod.img2,
                              img3: myprod.img3,
                              prodPrice: myprod.prodPrice,
                              oldprodPrice: myprod.oldprodPrice,
                              details: myprod.details),
                        );
                        log("======added=====");
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productImages(myprod.img1!),
                productImages(myprod.img2!),
                productImages(myprod.img3!),
              ],
            ),
            Text("${myprod.name} ..${myprod.details} "),
            Text("${myprod.prodPrice}\$"),
            Text("select color"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Color.fromARGB(255, 5, 240, 240),
                  ),
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Color.fromARGB(255, 47, 87, 2),
                  ),
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Color.fromARGB(255, 0, 2, 92),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),

            // add to cart
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if (count == 0) {
                          } else {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text("-"),
                          ),
                          width: 60.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: Color.fromARGB(255, 0, 2, 92),
                          ),
                        ),
                      ),
                      Text("$count"),
                      InkWell(
                        onTap: () {
                          if (count == 40) {
                          } else {
                            setState(() {
                              count++;
                            });
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text("+"),
                          ),
                          width: 60.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: Color.fromARGB(255, 0, 2, 92),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: buttonSolid(
                      b_color: AppColors.quaternaryColor,
                      f_color: AppColors.primary_containerColor,
                      text: "add to cart",
                      ontap: () {
                        listcartproduct.add(CartProduct(
                            img1: myprod.img1!,
                            counts: count,
                            name: myprod.name!,
                            prodPrice: myprod.prodPrice!,
                            totalPrice: count * myprod.prodPrice!));
                        print(listcartproduct);
                      }),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector productImages(String img) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backimg = img;
        });
      },
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.quaternaryColor, width: 4),
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: AppColors.tertiaryColor,
            image: DecorationImage(image: NetworkImage(img))),
      ),
    );
  }
}
