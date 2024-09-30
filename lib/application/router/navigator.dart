import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thecat_rodgav/application/router/routes.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

extension Navigation on BuildContext {
  void popNavigate() => canPop() ? pop() : goSplash();

  void goSplash() => goNamed(Routes.initial);

  void goCats() => goNamed(Routes.cats);

  void pushCatDetail(String idCat, Breed? breed) => goNamed(Routes.catDetail,
      pathParameters: {'idCat': idCat}, extra: breed);
}
