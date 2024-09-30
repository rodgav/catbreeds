import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

part 'cat_detail_event.dart';

part 'cat_detail_state.dart';

class CatDetailBloc extends Bloc<CatDetailEvent, CatDetailState> {
  CatDetailBloc() : super(CatDetailInitial()) {
    on<CatDetailEvent>((event, emit) {});
    on<OnGetBreedForId>(
        (event, emit) {}); //TODO: para poder obtener un breed en base a su id
    on<OnSetBreed>((event, emit) {
      final breed = event.breed;
      List<String> data = [
        breed.description,
        breed.origin,
        breed.intelligence.toString(),
        breed.adaptability.toString(),
        breed.dogFriendly.toString(),
      ];
      emit(CatDetailSuccess(event.breed, data));
    });
  }
}
