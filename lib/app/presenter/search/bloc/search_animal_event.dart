part of 'search_animal_bloc.dart';

final class SearchAnimalEvent extends Equatable {
  final String args;
  final int farmId;

  const SearchAnimalEvent({required this.args, required this.farmId});
  @override
  List<Object> get props => [];
}
