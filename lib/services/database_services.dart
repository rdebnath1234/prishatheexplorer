import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseProvider {
  final String? uid;
  DatabaseProvider({this.uid});
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");
  //save user data
  Future saveUserData(String name, String email,String gender) async {
    final user = {
      "uid": uid,
      "name": name,
      "email": email,
      "gen":gender,
    };
    await userCollection.doc(uid).set(user);
  }
  //get user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot =
    await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
