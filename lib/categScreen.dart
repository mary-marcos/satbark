import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:satbark/constants.dart';
import 'package:flutter/material.dart';
import 'package:satbark/models/category.dart';

class Categor extends StatefulWidget {
  const Categor({super.key});

  @override
  State<Categor> createState() => _CategorState();
}

class _CategorState extends State<Categor> {
  late final CategoryModel myprod;
  // late Product currentproduct;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    myprod = args?['Product'];

    // currentproduct = myprod;
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
          myprod.name!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(myprod.name!).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: ListView.builder(
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
                    title: Text(snapshot.data!.docs[index]["nameprod"]),
                    // dense: true,
                    trailing: Text(
                      "${snapshot.data!.docs[index]["prodPrice"]}\$",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length,
            ),
          );
        },
      ),
    );
  }
}
