part of 'update_animal_bloc.dart';

final class UpdateAnimalEvent extends Equatable {
  final AnimalEntity animalEntity;
  const UpdateAnimalEvent({required this.animalEntity});

  @override
  List<Object> get props => [];
}
