import 'package:flutter/material.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:thecat_rodgav/application/internationalization/generated/l10n.dart';
import 'package:thecat_rodgav/application/utils/extensions/string_extension.dart';
import 'package:thecat_rodgav/data/network/dio_client.dart';
import 'package:thecat_rodgav/view/model/breed.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';

class BreedTileWidget extends StatelessWidget {
  final Breed _breed;

  const BreedTileWidget(this._breed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TheCatsDoubles.d8),
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(TheCatsDoubles.d8),
            width: double.infinity,
            height: TheCatsDoubles.d120,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: _breed.image.url.isNotEmpty
                    ? NetworkImage(
                        headers: const {xApiKey: xApiKeyValue},
                        _breed.image.url)
                    : const AssetImage(TheCatImages.cats),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_breed.name),
                  Text(_breed.origin),
                  Text(_breed.intelligence.toString()),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    context.pushCatDetail(_breed.id, _breed);
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            )),
      ),
    );
  }
}
