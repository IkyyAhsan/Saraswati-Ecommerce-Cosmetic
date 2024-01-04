import 'package:flutter/material.dart';
import 'package:saraswati_application_project/common/widgets/appbar/appbar.dart';
import 'package:saraswati_application_project/common/widgets/products/ratings/rating_indicator.dart';
import 'package:saraswati_application_project/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:saraswati_application_project/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Liquid lipstick dengan tekstur mousse yang nyaman dipakai di bibir. \n\nDiformulasikan khusus untuk membuat bibirmu nyaman menggunakannya, karena adanya kandungan: \n\n1. Velvet Powdery Texture, tekstur yang halus dan lembut saat diaplikasikan di bibir dengan hasil akhir powdery yang ringan dan nyaman di bibir tanpa rasa lengket. tidak membuat bibir kering atau pecah-pecah karena mengandung Vitamin E sebagai pelembab. \n\n2. Easy to set & Matte Finish, hasil matte yang cepat "Set" di bibir tanpa harus menunggu lama. Warna yang dihasilkan intens dengan cover yang tinggi.\n\n3. Long lasting, non transfer, bila sudah set dan long lasting untuk penggunaan sehari-hari.'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// -- Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5),
              Text('199 ', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// -- User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
          ),
      ),
    );
  }
}