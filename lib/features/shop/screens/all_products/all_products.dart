import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saraswati_application_project/common/widgets/appbar/appbar.dart';
import 'package:saraswati_application_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:saraswati_application_project/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:saraswati_application_project/features/shop/controllers/product/all_products_controller.dart';
import 'package:saraswati_application_project/features/shop/models/product_model.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/data/repositories/products/product_repository.dart';
import 'package:saraswati_application_project/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // -- Initializa controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductByQuery(query),
            builder: (context, snapshot) {
              // -- Check the state of the FutureBuilder snapshot
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // -- Return appropriate widget based on snapshot state
              if (widget != null) return widget;


              // -- Product Found
              final products = snapshot.data!;

              return TSortableProducts(products: products);
            }),
        ),
      ),
    );
  }
}

