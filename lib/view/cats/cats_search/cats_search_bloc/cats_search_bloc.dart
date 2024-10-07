import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thecat_rodgav/domain/mapper/breed_model_mapper.dart';
import 'package:thecat_rodgav/domain/usecases/get_breed_usecase.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

part 'cats_search_event.dart';

part 'cats_search_state.dart';

class CatsSearchBloc extends Bloc<CatsSearchEvent, CatsSearchState> {
  final GetBreedUseCase _getBreedUseCase;

  CatsSearchBloc(this._getBreedUseCase) : super(CatsSearchInitial()) {
    on<CatsSearchEvent>((event, emit) {});
    on<OnSearchEvent>(_onSearchEvent);
  }

  FutureOr<void> _onSearchEvent(
      OnSearchEvent event, Emitter<CatsSearchState> emit) async {
    emit(CatsSearchLoading());
    (await _getBreedUseCase.execute(event.breedId)).when(left: (left) {
      emit(CatsSearchError(left.title, left.message));
    }, right: (right) {
      emit(CatsSearchSuccess(right.domainToView()));
    });
  }
}
