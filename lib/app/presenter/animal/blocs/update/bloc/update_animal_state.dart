part of 'update_animal_bloc.dart';

sealed class UpdateAnimalState extends Equatable {
  const UpdateAnimalState();

  @override
  List<Object> get props => [];
}

final class UpdateAnimalInitial extends UpdateAnimalState {}

final class UpdateAnimalLoading extends UpdateAnimalState {}

final class UpdateAnimalSuccess extends UpdateAnimalState {}

final class UpdateAnimalError extends UpdateAnimalState {}
