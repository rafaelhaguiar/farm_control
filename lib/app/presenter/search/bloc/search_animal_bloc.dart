import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/usecases/search_animal_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_animal_event.dart';
part 'search_animal_state.dart';

class SearchAnimalBloc extends Bloc<SearchAnimalEvent, SearchAnimalState> {
  final SearchAnimalsUsecase usecase;
  SearchAnimalBloc({required this.usecase}) : super(SearchAnimalInitial()) {
    on<SearchAnimalEvent>((event, emit) async {
      try {
        emit(SearchAnimalLoading());
        if (event.args.isEmpty) {
          emit(const SearchAnimalSuccess(animalList: []));
        }
        final searchResult =
            await usecase(args: event.args, farmId: event.farmId);
        await Future.delayed(const Duration(seconds: 2));

        emit(SearchAnimalSuccess(animalList: searchResult));
      } on Exception {
        emit(SearchAnimalError());
      }
    });
  }
}
