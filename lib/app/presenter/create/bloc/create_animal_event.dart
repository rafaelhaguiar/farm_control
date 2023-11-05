part of 'create_animal_bloc.dart';

final class CreateAnimalEvent extends Equatable {
  final List<Map<String, dynamic>> mapList;
  const CreateAnimalEvent({required this.mapList});

  @override
  List<Object> get props => [mapList.length];
}
