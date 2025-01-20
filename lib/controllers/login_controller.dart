import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jekitchen/route/myapp_route.dart';

class LoginController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

  Future<void> loginwithgoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleUser != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await firebaseAuth.signInWithCredential(credential);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  Future<void> logout() async {
  try {
    await firebaseAuth.signOut(); // Logout dari Firebase
    await googleSignIn.signOut(); // Logout dari Google Sign-In
    
    // Set nilai user ke null
    user.value = null;
  } catch (e) {
    Get.snackbar("Error", "Failed to logout: $e");
  }
}

}
