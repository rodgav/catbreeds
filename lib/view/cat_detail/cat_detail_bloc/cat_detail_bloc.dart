import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_detail_event.dart';
part 'cat_detail_state.dart';

class CatDetailBloc extends Bloc<CatDetailEvent, CatDetailState> {
  CatDetailBloc() : super(CatDetailInitial()) {
    on<CatDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
