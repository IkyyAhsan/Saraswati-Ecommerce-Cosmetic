import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saraswati_application_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';
import 'package:saraswati_application_project/utils/constants/sizes.dart';
import 'package:saraswati_application_project/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key, 
    required this.selectedAddress,

  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
  width: double.infinity,
  showBorder: true,
  padding: const EdgeInsets.all(TSizes.md),
  backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
  borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkerGrey : TColors.grey,
  margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
  child: Stack(
    children: [
      Positioned(
        right: 5,
        top: 0,
        child: Icon(
          selectedAddress ? Iconsax.tick_circle5 : null,
          color: selectedAddress 
              ? dark 
                  ? TColors.light 
                  : TColors.dark
              : null
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Arsakha Al-Gibran R.',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: TSizes.sm / 2,),
          const Text('(+62) 822-4869-6800', maxLines: 1, overflow: TextOverflow.ellipsis,),
          const SizedBox(height: TSizes.sm / 2,),
          const Text('Palem 2 Residence, Sukapura, Kec. Dayeuhkolot, Kab. Bandung, Jawa Barat 40267', softWrap: true,),
        ],
      )
    ],
  ),
);
  }
}