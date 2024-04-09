import 'package:satbark/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/models/cartproduct.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int tottal = 0;
  @override
  void initState() {
    super.initState();
    for (var i in listcartproduct) {
      tottal = tottal + i.totalPrice;
    }
  }

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
          "Cart",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400.w,
            color: AppColors.primaryColor,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 300.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listcartproduct[index].img1),
                                    fit: BoxFit.fill)),
                          ),
                          title: Text(
                            listcartproduct[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text("\$ ${listcartproduct[index].totalPrice}"),
                          // dense: true,
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                listcartproduct.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.close),
                          ),
                        );
                      },
                      itemCount: listcartproduct.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      color: AppColors.primary_containerColor,
                      height: 20,
                      thickness: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      color: AppColors.primary_containerColor,
                      height: 20,
                      thickness: 4,
                    ),
                  ),
                  Text(
                    "tottal:$tottal",
                  ),
                  buttonSolid(
                      b_color: AppColors.primary_containerColor,
                      text: "Confirm",
                      ontap: () {
                        Navigator.pushNamed(context, '/confirmation',
                            arguments: {
                              'tottal': tottal,
                            });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: AppColors.primary_containerColor,
                        height: 25.h,
                        width: 5.w,
                      ),
                    ],
                  ),
                  Divider(
                    // indent: 12,
                    height: 20,
                    indent: 40,
                    endIndent: 40,
                    color: AppColors.primary_containerColor,
                    thickness: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
