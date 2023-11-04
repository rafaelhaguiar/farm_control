import 'package:equatable/equatable.dart';

abstract class AnimalEntity extends Equatable {
  final int animalId;
  final String animalTag;
  final int farmId;

  const AnimalEntity({
    required this.animalId,
    required this.animalTag,
    required this.farmId,
  });

  @override
  List<Object> get props {
    return [animalTag, animalId];
  }
}
