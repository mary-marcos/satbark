import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:satbark/models/order.dart';
import 'package:satbark/models/produc_model.dart';
import 'package:satbark/models/user.dart';
import 'package:satbark/models/cartproduct.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

  static Future<void> Add(
      String userName, String age, String phoneNumber) async {
    await FirebaseFirestore.instance.collection('User').add({
      "userName": userName,
      "age": age,
      "phoneNumber": phoneNumber,
    });
  }

  static Future<void> AddCurrent(
      String userName, String age, String phoneNumber) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .set({
      "userName": userName,
      "age": age,
      "phoneNumber": phoneNumber,
    });
  }

  static Future<usermodel> getCurrent() async {
    late usermodel userm;
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        userm = usermodel(
            name: snapshot.data()!["userName"],
            phone: snapshot.data()!["phoneNumber"],
            age: snapshot.data()!["age"]);
        print("==========${userm.name}===========");

        return userm;
      } else {
        userm = usermodel(name: "name", phone: "phone", age: "age");
      }
    });
    return userm;
  }

  static Future<void> Addwishlist(Product myprod) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .collection("Wishlist")
        .add({
      "neme": myprod.name,
      "img1": myprod.img1,
      "img2": myprod.img2,
      "img3": myprod.img3,
      "details": myprod.details,
      "oldprodPrice": myprod.oldprodPrice,
      "prodPrice": myprod.prodPrice,
    });
  }

  static Future<void> Addorder(UserOrder myorder) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .collection("Orders")
        .add({
      "neme": myorder.name,
      "address": myorder.address,
      "phone": myorder.phone,
      "totalprice": myorder.totalprice,
      "order": myorder.order,
    });
  }
}
