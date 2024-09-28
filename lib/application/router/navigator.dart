import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thecat_rodgav/application/router/routes.dart';


extension Navigation on BuildContext {
  void popNavigate() => canPop() ? pop() : goSplash();

  void goSplash() => goNamed(Routes.initial);

  void goCats() => this.goNamed(Routes.cats);
}
