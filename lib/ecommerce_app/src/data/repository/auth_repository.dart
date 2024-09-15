import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_facebook_auth/flutter_facebook_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:twitter_login/twitter_login.dart";

class AuthRepository{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn= await GoogleSignIn().signIn();
      if (googleSignIn == null) {
        // User canceled the sign-in process
        debugPrint("User canceled the signin process.");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignIn.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential authResult =await _auth.signInWithCredential(credential);
      debugPrint('User: ${authResult.user?.email}');
      return authResult.user;
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      return null;
    }
  }
  Future<User?> signInWithFacebook() async {
    // https://bloc-ecommerce-180824.firebaseapp.com/__/auth/handler
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }
  Future<User?> signInWithTweeter() async {
    // https://bloc-ecommerce-180824.firebaseapp.com/__/auth/handler
    try {
      final TwitterLogin twitterLogin = await TwitterLogin(
        apiKey:"9j4G9tW2t2iE2rUyvru7ESTX3",
        apiSecretKey: "siD4ZsDFXM7tbfXLeOQtFCb8rNj5pXbgtIgJCrMrJv2zen9b8s",
          redirectURI: 'bloc_ecommerce_180824://'
      );
      final result = await twitterLogin.loginV2();
      if (result.status == LoginStatus.success) {
        final credential = TwitterAuthProvider.credential(accessToken: result.authToken!, secret: result.authTokenSecret!);
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Twitter login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Twitter login failed: ${result.errorMessage}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Twitter: $error");
      return null;
    }
  }
  Future<void> createUserInDatabase (User user) async{
      await _firestore.collection("users").doc(user.uid);
  }
}