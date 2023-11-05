import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/usecases/update_animal_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_animal_event.dart';
part 'update_animal_state.dart';

class UpdateAnimalBloc extends Bloc<UpdateAnimalEvent, UpdateAnimalState> {
  final UpdateAnimalUsecase usecase;

  UpdateAnimalBloc({required this.usecase}) : super(UpdateAnimalInitial()) {
    on<UpdateAnimalEvent>((event, emit) async {
      try {
        emit(UpdateAnimalLoading());
        await usecase(animal: event.animalEntity);
        emit(UpdateAnimalSuccess());
      } catch (e) {
        emit(UpdateAnimalError());
      }
    });
  }
}
