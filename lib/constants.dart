import 'package:satbark/adressinfirmation.dart';
import 'package:satbark/cart.dart';
import 'package:satbark/categScreen.dart';
import 'package:satbark/editprofile.dart';
import 'package:satbark/home_Screen.dart';
import 'package:satbark/itemdetails.dart';
import 'package:satbark/models/produc_model.dart';
import 'package:satbark/profileScreen.dart';
import 'package:satbark/signin_screen.dart';
import 'package:satbark/signup_Screen.dart';
import 'package:satbark/signup_infoScreen.dart';
import 'package:satbark/store.dart';

import 'package:satbark/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satbark/wishlist.dart';

class AppColors {
  static const primaryColor = const Color.fromRGBO(187, 212, 206, 1);
  static final secondaryColor = Color.fromRGBO(103, 145, 134, 1);
  static final primary_containerColor = Color.fromRGBO(38, 78, 112, 1);
  static final tertiaryColor = Color.fromRGBO(253, 235, 211, 1);

  static final quaternaryColor = Color.fromRGBO(249, 180, 171, 1);
}

Map<String, Widget Function(BuildContext)> myRoutes = {
  '/': (context) => Welcome_Screen(),
  '/SignUP': (context) => SignUP(),
  '/SignIn': (context) => SignIn(),
  '/home': (context) => Home(),
  '/category': (context) => Categor(),
  '/Profile': (context) => Profile(),
  '/cart': (context) => cart(),
  '/SignInfo': (context) => SignInfo(),
  '/editprofile': (context) => EditProfile(),
  '/store': (context) => Store(),
  '/Wishlist': (context) => Wishlist(),
  '/ItemDetails': (context) => ItemDetails(),
  '/confirmation': (context) => confirmation(),
};
