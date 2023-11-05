part of 'delete_animal_bloc.dart';

sealed class DeleteAnimalState extends Equatable {
  const DeleteAnimalState();

  @override
  List<Object> get props => [];
}

final class DeleteAnimalInitial extends DeleteAnimalState {}

final class DeleteAnimalLoading extends DeleteAnimalState {}

final class DeleteAnimalSuccess extends DeleteAnimalState {}

final class DeleteAnimalError extends DeleteAnimalState {}
