import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thecat_rodgav/domain/mapper/breed_model_mapper.dart';
import 'package:thecat_rodgav/domain/usecases/get_breeds_usecase.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

part 'cats_event.dart';

part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final GetBreedsUseCase _getBreedsUseCase;

  CatsBloc(this._getBreedsUseCase) : super(CatsInitial()) {
    //on<CatsEvent>((event, emit) {});
    on<OnGetBreeds>(_onGetBreeds);
  }

  FutureOr<void> _onGetBreeds(CatsEvent event, Emitter<CatsState> emit) async {
    (await _getBreedsUseCase.execute(null)).when(left: (left) {
      emit(CatsError(left.title, left.message));
    }, right: (right) {
      final breeds = right.map((e) => e.domainToView()).toList();
      emit(CatsSuccess(breeds));
    });
  }
}
