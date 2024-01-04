import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/brands/brand_card.dart';
import 'package:saraswati_application_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:saraswati_application_project/common/widgets/shimmer/shimmer.dart';
import 'package:saraswati_application_project/features/shop/models/brand_model.dart';
import 'package:saraswati_application_project/features/shop/screens/all_brands/brand_products.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images, 
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// -- Brand with Product Count
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems),
      
            /// -- Brand Top 3 Product Images
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          )
      ),
    );
  }
}

