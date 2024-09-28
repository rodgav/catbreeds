import 'package:flutter/material.dart';
import 'package:thecat_rodgav/application/constants/doubles_constant.dart';

class CatResponsive extends StatelessWidget {
  final Widget widget;

  const CatResponsive({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FractionallySizedBox(
          widthFactor: _getWidthFactor(constraints.maxWidth),
          heightFactor: TheCatsDoubles.d1,
          child: widget,
        );
      },
    );
  }

  double _getWidthFactor(double maxWidth) {
    if (maxWidth > TheCatsDoubles.d1050) {
      return TheCatsDoubles.d0_35;
    } else if (maxWidth > TheCatsDoubles.d800) {
      return TheCatsDoubles.d0_7;
    } else {
      return TheCatsDoubles.d1;
    }
  }
}
