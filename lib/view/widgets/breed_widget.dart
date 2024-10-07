import 'package:flutter/material.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/utils/extensions/string_extension.dart';
import 'package:thecat_rodgav/data/network/dio_client.dart';
import 'package:thecat_rodgav/view/model/breed.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';

class BreedWidget extends StatelessWidget {
  final S _s;
  final Breed _breed;

  const BreedWidget(this._s, this._breed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TheCatsDoubles.d8),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(TheCatsDoubles.d8),
          width: double.infinity,
          height: TheCatsDoubles.d350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_breed.name),
                  GestureDetector(
                      onTap: () {
                        context.pushCatDetail(_breed.id, _breed);
                      },
                      child: Text(_s.more.capitalize()))
                ],
              ),
              const SizedBox(height: TheCatsDoubles.d8),
              Expanded(
                  child: _breed.image.url.isNotEmpty
                      ? Image.network(
                          headers: const {xApiKey: xApiKeyValue},
                          _breed.image.url)
                      : Image.asset(TheCatImages.cats)),
              const SizedBox(height: TheCatsDoubles.d8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_breed.origin),
                  Text(_breed.intelligence.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
