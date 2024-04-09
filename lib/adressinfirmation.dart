import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satbark/businesslogic/firebase/fireStore.dart';
import 'package:satbark/constants.dart';
import 'package:satbark/models/cartproduct.dart';
import 'package:satbark/models/order.dart';
import 'package:satbark/widgets/buttons.dart';

class confirmation extends StatefulWidget {
  @override
  _confirmationState createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String myorder = "";

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  int tottal = 0;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    tottal = args?['tottal'];

    return Scaffold(
      appBar: AppBar(
        title: Text('adress info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex: 1, child: Text("""tottal price:""")),
                      Expanded(
                          flex: 1,
                          child: Text("$tottal"
                              //  "\$ ${listcartproduct.totalPrice}"
                              ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(flex: 1, child: Text("tax :")),
                      Expanded(flex: 1, child: Text("9"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(flex: 1, child: Text("Delivery :")),
                      Expanded(flex: 1, child: Text("9"))
                    ],
                  ),
                ],
              ),
              width: 300.w,
            ),
            buttonSolid(
              b_color: AppColors.primary_containerColor,
              text: "Confirm",
              ontap: () {
                for (var i in listcartproduct) {
                  setState(() {
                    myorder += "${i.name}   x${i.counts}  - ";
                  });
                }
                ;
                // Access the text entered using controllers
                String name = _nameController.text;
                String phone = _phoneController.text;
                String address = _addressController.text;
                FireStore.Addorder(UserOrder(
                    name: name,
                    address: address,
                    phone: phone,
                    totalprice: tottal + 18,
                    order: myorder));

                // Do something with the data, such as validation or submission
              },
            ),
          ],
        ),
      ),
    );
  }
}
