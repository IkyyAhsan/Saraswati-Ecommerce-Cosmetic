import 'package:flutter/material.dart';
import 'package:saraswati_application_project/common/widgets/images/t_rounded_image.dart';
import 'package:saraswati_application_project/common/widgets/texts/product_title_text.dart';
import 'package:saraswati_application_project/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(imageUrl: TImages.productImage1,
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
    
        ///Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: 'Wardah'),
              const Flexible(child: TProductTitleText(title: 'Colorfit Velvet Matte Lip Mousse', maxLines: 1,)),
              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '01 Brown Dreamer', style: Theme.of(context).textTheme.bodyLarge)
                    
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}