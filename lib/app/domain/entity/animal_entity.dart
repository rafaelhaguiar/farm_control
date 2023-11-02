import 'package:equatable/equatable.dart';

abstract class AnimalEntity extends Equatable {
  final int animalTag;
  final int farmId;
  final double animalWeight;
  final bool isAlive;
  final String category;

  const AnimalEntity({
    required this.animalTag,
    required this.farmId,
    required this.animalWeight,
    required this.isAlive,
    required this.category,
  });

  @override
  List<Object> get props {
    return [animalTag];
  }
}
