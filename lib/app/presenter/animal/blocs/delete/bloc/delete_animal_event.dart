part of 'delete_animal_bloc.dart';

final class DeleteAnimalEvent extends Equatable {
  final int animalId;
  const DeleteAnimalEvent({required this.animalId});

  @override
  List<Object> get props => [animalId];
}
