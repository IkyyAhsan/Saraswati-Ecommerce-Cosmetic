import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/styles/spacing_styles.dart';
import 'package:saraswati_application_project/common/widgets/login_signup/form_divider.dart';
import 'package:saraswati_application_project/common/widgets/login_signup/social_buttons.dart';
import 'package:saraswati_application_project/features/authentication/screens/login/widgets_login/login_form.dart';
import 'package:saraswati_application_project/features/authentication/screens/login/widgets_login/login_header.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title & Subtitle
              const TLoginHeader(),

              ///Form
              const TLoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwItems,),


              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}







