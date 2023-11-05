import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/usecases/delete_animal_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_animal_event.dart';
part 'delete_animal_state.dart';

class DeleteAnimalBloc extends Bloc<DeleteAnimalEvent, DeleteAnimalState> {
  final DeleteAnimalUsecase usecase;
  DeleteAnimalBloc({required this.usecase}) : super(DeleteAnimalInitial()) {
    on<DeleteAnimalEvent>((event, emit) async {
      try {
        emit(DeleteAnimalLoading());
        await usecase(animalId: event.animalId);
        emit(DeleteAnimalSuccess());
      } on Exception {
        emit(DeleteAnimalError());
      }
    });
  }
}
