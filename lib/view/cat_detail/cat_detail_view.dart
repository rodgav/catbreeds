import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';
import 'package:thecat_rodgav/application/constants/image_constant.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';

class CatDetailView extends StatelessWidget {
  const CatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CatResponsive(
        widget: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    context.popNavigate();
                  },
                  icon: Icon(Platform.isAndroid
                      ? Icons.arrow_back
                      : Icons.arrow_back_ios_new)),
              title: Text('Nombre Raza'),
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
                        child: Image.asset(TheCatImages.cats)),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Text('Descripción');
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: TheCatsDoubles.d8);
                        },
                        itemCount: 20,
                      ),
                    )
                  ],
                ))));
  }
}
