import 'package:flutter/material.dart';
import 'package:saraswati_application_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:saraswati_application_project/common/widgets/images/t_circular_image.dart';
import 'package:saraswati_application_project/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:saraswati_application_project/features/shop/models/brand_model.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/constants/enums.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap, 
    required this.showBorder, required this.brand
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      /// -- Container Design
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// -- Texts
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleTextWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large,),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}