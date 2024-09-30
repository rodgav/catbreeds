import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';
import 'package:thecat_rodgav/application/router/router.dart';
import 'package:thecat_rodgav/data/network/dio_client.dart';
import 'package:thecat_rodgav/view/cat_detail/cat_detail_bloc/cat_detail_bloc.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

class CatDetailView extends StatefulWidget {
  final String? idCat;

  final Object? extra;

  const CatDetailView(this.idCat, this.extra, {super.key});

  @override
  State<CatDetailView> createState() => _CatDetailViewState();
}

class _CatDetailViewState extends State<CatDetailView> {
  @override
  void initState() {
    final idBreed = widget.idCat;
    final breed = widget.extra as Breed?;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (idBreed == null) {
        context.popNavigate();
      } else {
        if (breed != null) {
          context.read<CatDetailBloc>().add(OnSetBreed(breed));
        } else {
          context.read<CatDetailBloc>().add(OnGetBreedForId(idBreed));
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CatResponsive(widget: BlocBuilder<CatDetailBloc, CatDetailState>(
      builder: (context, state) {
        switch (state) {
          case CatDetailInitial _:
            return const Center(child: CircularProgressIndicator());
          case CatDetailSuccess _:
            final breed = state.breed;
            final data = state.data;
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        context.popNavigate();
                      },
                      icon: Icon(Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios_new)),
                  title: Text(breed.name),
                ),
                body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TheCatsDoubles.d8,
                        vertical: TheCatsDoubles.d10),
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: TheCatsDoubles.d350,
                            child: breed.image.url.isNotEmpty
                                ? Image.network(
                                    breed.image.url,
                                    headers: const {xApiKey: xApiKeyValue},
                                  )
                                : Image.asset(TheCatImages.cats)),
                        const SizedBox(height: TheCatsDoubles.d10),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Text(data[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: TheCatsDoubles.d8);
                            },
                            itemCount: data.length,
                          ),
                        )
                      ],
                    )));
        }
      },
    ));
  }
}
