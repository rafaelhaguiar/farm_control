part of 'create_animal_bloc.dart';

sealed class CreateAnimalState extends Equatable {
  const CreateAnimalState();

  @override
  List<Object> get props => [];
}

final class CreateAnimalInitial extends CreateAnimalState {}

final class CreateAnimalLoading extends CreateAnimalState {}

final class CreateAnimalSuccess extends CreateAnimalState {}

final class CreateAnimalError extends CreateAnimalState {}
