import 'package:flutter/material.dart';
import 'package:saraswati_application_project/common/widgets/texts/section_heading.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Arsakha Al-Gibran R.', style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(width: TSizes.spaceBtwItems,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('+62 822-4869-6800', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('Palem 2 Residence, Sukapura 40267', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
          ],
        ),
      ],
    );
  }
}