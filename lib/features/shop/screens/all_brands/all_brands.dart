import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/appbar/appbar.dart';
import 'package:saraswati_application_project/common/widgets/brands/brand_card.dart';
import 'package:saraswati_application_project/common/widgets/layouts/grid_layout.dart';
import 'package:saraswati_application_project/common/widgets/shimmer/brand_shimmer.dart';
import 'package:saraswati_application_project/common/widgets/texts/section_heading.dart';
import 'package:saraswati_application_project/features/shop/controllers/product/brand_controller.dart';
import 'package:saraswati_application_project/features/shop/screens/all_brands/brand_products.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              const TSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// -- Brands
                    Obx(
                      (){
                        if (brandController.isLoading.value) return const TBrandsShimmer();

                        if (brandController.allBrands.isEmpty){
                          return Center(
                            child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                          );
                        }

                        return TGridLayout(
                          itemCount: brandController.allBrands.length, 
                          mainAxisExtent: 80, 
                          itemBuilder: (_, index) {
                            final brand = brandController.allBrands[index];
                            return TBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () => Get.to(() => BrandProducts(brand: brand,)),
                              );
                        }
                        );
                        
                      } 
                    ),
            ],
          ),
        ),
      ),
    );
  }
}