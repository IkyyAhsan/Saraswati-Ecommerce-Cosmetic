import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/loaders/animation_loader.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

///A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  ///Open a full-screen loading dialog with a given text and animation
  ///This method doesn't return anything
  ///
  ///Parameters:
  ///  - text: The text to be displayed in the loading dialog
  ///  - animation: The Lottie animation to be shown
  static void OpenLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        )
        ),
      );
  }

  /// -- Stop the currently open loading dialog
  /// -- This method doesn't return anything.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}