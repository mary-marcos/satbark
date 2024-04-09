import 'package:firebase_auth/firebase_auth.dart';

class Authontication {
  static final auth = FirebaseAuth.instance;

  static void Createuser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> Signin(String email, String password) async {
    UserCredential user;
    user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print("-----------------$user");
    return user;
  }
}
