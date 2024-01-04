import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/data/repositories/authentication/authentication_repository.dart';
import 'package:saraswati_application_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/utils/helpers/network_manager.dart';
import 'package:saraswati_application_project/utils/popups/full_screen_loader.dart';
import 'package:saraswati_application_project/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();


  /// -- Variables
  final email = TextEditingController();
  GlobalKey<FormState> ForgetPasswordFormKey = GlobalKey<FormState>();

  /// -- Send Reset Password Email
  sendPasswordResetEmail()async{
    try {
      // -- Start Loading
      TFullScreenLoader.OpenLoadingDialog('Processing your request...', TImages.checkedIllustration);


      // -- Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;}


      // -- Form Validation
      if (!ForgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }


      // -- Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());


      // -- Remove Loader
      TFullScreenLoader.stopLoading();


      // -- Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Set to Reset your Password'.tr);


      // -- Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
  }

  resendPasswordResetEmail(String email)async{
    try {
      // -- Start Loading
      TFullScreenLoader.OpenLoadingDialog('Processing your request...', TImages.checkedIllustration);


      // -- Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;}


      // -- Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);


      // -- Remove Loader
      TFullScreenLoader.stopLoading();


      // -- Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Set to Reset your Password'.tr);


    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
  }
}