import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thecat_rodgav/application/constants/int_constant.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void callFirstService() {
    Future.delayed(const Duration(seconds: TheCatsInts.i3), () {
      emit(SplashSuccess());
    });
  }
}
