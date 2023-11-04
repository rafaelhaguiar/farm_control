import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';

final class SaveAnimalsUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  SaveAnimalsUsecase({required this.repositoryInterface});

  Future<void> call(
      {required List<SaveAnimalsUsecaseParams> animalsList}) async {
    return repositoryInterface.saveAnimals(
        animalsList: animalsList
            .map((e) => {"animal_tag": e.animalTag, "farm_id": e.farmId})
            .toList());
  }
}

final class SaveAnimalsUsecaseParams extends Equatable {
  final String animalTag;
  final int farmId;

  const SaveAnimalsUsecaseParams(
      {required this.animalTag, required this.farmId});

  @override
  List<Object?> get props => [animalTag, farmId];
}
