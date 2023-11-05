import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/usecases/save_animals_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_animal_event.dart';
part 'create_animal_state.dart';

class CreateAnimalBloc extends Bloc<CreateAnimalEvent, CreateAnimalState> {
  final SaveAnimalsUsecase usecase;

  CreateAnimalBloc({required this.usecase}) : super(CreateAnimalInitial()) {
    on<CreateAnimalEvent>((event, emit) async {
      try {
        emit(CreateAnimalLoading());
        final convertedList = event.mapList
            .map((e) => SaveAnimalsUsecaseParams(
                animalTag: e['animal_tag'], farmId: e['farm_id']))
            .toList();
        await usecase(animalsList: convertedList);
        await Future.delayed(const Duration(seconds: 2));
        emit(CreateAnimalSuccess());
      } on Exception {
        emit(CreateAnimalError());
      }
    });
  }
}
