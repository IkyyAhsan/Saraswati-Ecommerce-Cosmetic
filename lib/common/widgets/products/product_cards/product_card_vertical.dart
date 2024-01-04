import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saraswati_application_project/common/styles/shadows.dart';
import 'package:saraswati_application_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:saraswati_application_project/common/widgets/icons/t_circular_icon.dart';
import 'package:saraswati_application_project/common/widgets/images/t_rounded_image.dart';
import 'package:saraswati_application_project/common/widgets/texts/product_price_text.dart';
import 'package:saraswati_application_project/common/widgets/texts/product_title_text.dart';
import 'package:saraswati_application_project/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:saraswati_application_project/features/shop/controllers/product/product_controller.dart';
import 'package:saraswati_application_project/features/shop/models/product_model.dart';
import 'package:saraswati_application_project/features/shop/screens/product_details/product_detail.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/constants/enums.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    /// -- Container with side paddings, color, edges, and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProdukShow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color:  dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// -- Thumbnail, Wishlish Button, Discount Taq
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  Center(child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true,)),
      
                  /// -- Sale Tag --
                  if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
                  ),
      
                  /// -- Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                    ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
      
      
            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true,),
                  const SizedBox(height: TSizes.spaceBtwItems / 2,),
                  TBrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            const Spacer(),

            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [



              /// -- Price
              Flexible(
                child: Column(
                  children: [
                    if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.sm),
                      child: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                      )
                    ),

                    /// -- Pricing, show sale price as main price if sale exist
                    Padding(padding: const EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: controller.getProductPrice(product),),
                    ),
                  ],
                ),
              ),

              /// -- Add to Cart Button
              Container(
                decoration: const BoxDecoration(
                  color: TColors.dark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.cardRadiusMd),
                    bottomRight: Radius.circular(TSizes.productImageRadius),
                  ),
                ),
                child: const SizedBox(
                  width: TSizes.iconLg * 1.2,
                  height: TSizes.iconLg * 1.2,
                  child: Center(
                    child: Icon(Iconsax.add, 
                    color: TColors.white),
                  )
                ),
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}





