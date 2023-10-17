import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Models/home_screen.dart';

class Services {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> addInitialDetails(String name, String email,
      String password, String gender) async {
      if(user!= Null) {
        final data = {
          'uid': uid,
          'name': name,
          'email': email,
          'gender': gender,
        };
        CollectionReference userCollection = _firestore.collection("Users");
        try
        {
          await userCollection.doc(uid).set(data);
          Get.to(HomeScreen(isLoggedIn: true)); // Assuming HomeScreen is defined and can be navigated to
        } catch (e)
        {
          Get.snackbar("Error", e.toString());
        }
      }
  }
}
