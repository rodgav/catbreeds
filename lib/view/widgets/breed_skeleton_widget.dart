import 'package:flutter/material.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:thecat_rodgav/application/constants/string_constant.dart';

class BreedSkeletonWidget extends StatelessWidget {
  const BreedSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: const EdgeInsets.only(bottom: TheCatsDoubles.d8),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(TheCatsDoubles.d8),
            width: double.infinity,
            height: TheCatsDoubles.d350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(TheCatStrings.loreIpsum),
                    Text(TheCatStrings.loreIpsum)
                  ],
                ),
                const SizedBox(height: TheCatsDoubles.d8),
                Expanded(child: Image.asset(TheCatImages.cats)),
                const SizedBox(height: TheCatsDoubles.d8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(TheCatStrings.loreIpsum),
                    Text(TheCatStrings.loreIpsum),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
