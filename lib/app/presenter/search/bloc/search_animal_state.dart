part of 'search_animal_bloc.dart';

sealed class SearchAnimalState extends Equatable {
  const SearchAnimalState();

  @override
  List<Object> get props => [];
}

final class SearchAnimalInitial extends SearchAnimalState {}

final class SearchAnimalLoading extends SearchAnimalState {}

final class SearchAnimalSuccess extends SearchAnimalState {
  final List<AnimalEntity> animalList;

  const SearchAnimalSuccess({required this.animalList});
}

final class SearchAnimalError extends SearchAnimalState {}
