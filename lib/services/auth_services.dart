import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
final GoogleSignIn _googleSignIn = GoogleSignIn();
class AuthService{
  Function()? onRegisterSuccess;
  //Google sign in
  Future <void> signInwithGoogle() async {
    try {
      // Begin interactive sign-in process
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in process
        print('User cancelled the sign-in process');
        return;
      }

      // Obtain authentication details from request
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      // Create a new credential for the user
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // Finally, let's log in
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Print the user's display name
      print(userCredential.user?.displayName);
    } catch (e) {
      // Handle any errors that occur during the sign-in process
      print('Error signing in with Google: $e');
    }
  }
  // Google Log Out
  Future<void> signOut() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();
      print("Signed out from Firebase");
      // Sign out from Google
      await GoogleSignIn().signOut();
      print("Signed out from Google");
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error signing out: $e');
    }
  }
  }
