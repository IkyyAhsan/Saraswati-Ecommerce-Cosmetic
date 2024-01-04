import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saraswati_application_project/data/repositories/user/user_repository.dart';
import 'package:saraswati_application_project/features/authentication/screens/login/login.dart';
import 'package:saraswati_application_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:saraswati_application_project/features/authentication/screens/signup/verify_email.dart';
import 'package:saraswati_application_project/navigation_menu.dart';
import 'package:saraswati_application_project/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:saraswati_application_project/utils/exceptions/firebase_exceptions.dart';
import 'package:saraswati_application_project/utils/exceptions/format_exceptions.dart';
import 'package:saraswati_application_project/utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  /// -- Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// -- Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// -- Called From main.dart on App Launch
  @override
  void onReady(){
    // -- Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// -- Function to determine the relevant Screen and redirect accordingly
  void screenRedirect() async {
    final user = _auth.currentUser;


    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    }else{
      // Local Storage
      deviceStorage.writeIfNull('ItsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('ItsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
      }
  }
    

  /* -------------------------------- Email & Password sign-in -------------------------------*/
  
  /// -- [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  /// -- [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  
  /// -- [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  /// -- [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  /// -- [ReAuthenticate] - REAUTHENTICATE - USER
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try{
      // -- Create a Credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // -- ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  
  /* -------------------------- Federated identity & social sign-in -------------------------*/

  /// -- [Google Authentication] -- GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      //Once Signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
  
  
  /// -- [Facebook Authentication] -- FACEBOOK

  /* --------------------- ./ end Federated Identity & social sign-in --------------------*/

  /// -- [LogoutUser] - Valid for any authentication
  Future<void> logout()async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something wen wrong. Please try again.';
    }
  }
  /// -- DELETE USER - Remove user Auth and Firestore Account
  Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      if (kDebugMode) print('Something went wrong: $e');
    }
  }
} 