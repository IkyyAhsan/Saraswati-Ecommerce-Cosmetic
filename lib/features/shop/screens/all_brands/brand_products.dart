import 'package:flutter/material.dart';
import 'package:saraswati_application_project/common/widgets/appbar/appbar.dart';
import 'package:saraswati_application_project/common/widgets/brands/brand_card.dart';
import 'package:saraswati_application_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:saraswati_application_project/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:saraswati_application_project/features/shop/controllers/product/brand_controller.dart';
import 'package:saraswati_application_project/features/shop/models/brand_model.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              SizedBox(height: TSizes.spaceBtwSections,),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  /// --  Handle loader, No record, QR Error Message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// -- Record Found!
                  final brandProducts = snapshot.data!;

                  return TSortableProducts(products: brandProducts,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}