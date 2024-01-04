import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/success_screen/success_screen.dart';
import 'package:saraswati_application_project/data/repositories/authentication/authentication_repository.dart';
import 'package:saraswati_application_project/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:saraswati_application_project/features/authentication/screens/login/login.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/constants/text_strings.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(verifyEmailController());


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(), 
            icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        //Padding to give default space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              
              ///Image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              ///Title & SubTitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,
              ),
              SizedBox(width: double.infinity,
                child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}