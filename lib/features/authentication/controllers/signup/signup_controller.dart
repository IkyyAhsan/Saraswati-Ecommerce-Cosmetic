import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/data/repositories/authentication/authentication_repository.dart';
import 'package:saraswati_application_project/data/repositories/user/user_repository.dart';
import 'package:saraswati_application_project/features/authentication/screens/signup/verify_email.dart';
import 'package:saraswati_application_project/features/personalization/models/user_model.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/utils/helpers/network_manager.dart';
import 'package:saraswati_application_project/utils/popups/full_screen_loader.dart';
import 'package:saraswati_application_project/utils/popups/loader.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// -- Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = false.obs; // Observable for hiding/showing password
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstName input
  final phoneNumber = TextEditingController(); // Controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation
  /// -- SIGNUP
  void signup() async{
    try{
    // -- Start Loading
    TFullScreenLoader.OpenLoadingDialog('We are processing your information...', TImages.loadingIllustration);
    
    // -- Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) return;
    
    // -- Form Validation
    if(!signupFormKey.currentState!.validate()) return;
    
    // -- Privacy Policy Check
    if(!privacyPolicy.value){
      TLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message: 'In order to create account, you must have to read and accept the Privacy Policy & Term of use.',
        );
        return;
    }
    // -- Register user in the Firebase Authentication & Save user data
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
    

    // -- Save Authenticated user data in Firebase Firestore 
    final newUser = UserModel(
      id: userCredential.user!.uid, 
      firstName: firstName.text.trim(), 
      lastName: lastName.text.trim(), 
      username: username.text.trim(), 
      email: email.text.trim(), 
      phoneNumber: phoneNumber.text.trim(), 
      profilePicture: '',
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

     // -- Remove Loader
    TFullScreenLoader.stopLoading();
    

    // -- Show Success Message
    TLoaders.successSnackBar(title: 'Congratulations', message: 'You account has been created! Verify email to continue.');

    
    // -- Move to Verify Email Screen
    Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
  }catch(e){


      // -- Remove Loader
    TFullScreenLoader.stopLoading();


    // -- Show some Generic Error to the user
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }    
}