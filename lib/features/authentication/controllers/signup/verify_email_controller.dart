import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/success_screen/success_screen.dart';
import 'package:saraswati_application_project/data/repositories/authentication/authentication_repository.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/utils/constants/text_strings.dart';
import 'package:saraswati_application_project/utils/popups/loader.dart';

class verifyEmailController extends GetxController{
  static verifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen Appears & Set Time for auto redirect
  @override
  void onInit(){
    sendEmailVerification();
    SetTimerForAutoRedirect();
    super.onInit();
  }


  /// Send Email Verification Link
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  /// Timer to automatically redirect on Email Verification
  SetTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async { 
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: TImages.trueIllustration, 
          title: TTexts.yourAccountCreatedTitle, 
          subTitle: TTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    }
    );
  }
  /// Nonually check if Email verified
  checkEmailVerificationStatus()async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified){
      Get.off(
        () => SuccessScreen(
          image: TImages.checkedIllustration, 
          title: TTexts.yourAccountCreatedTitle, 
          subTitle: TTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
      );
    }
  }
}