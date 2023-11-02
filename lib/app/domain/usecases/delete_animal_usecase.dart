import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class DeletaAnimalUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  DeletaAnimalUsecase({required this.repositoryInterface});

  Future<void> call({required int animalTag}) async {
    return repositoryInterface.deleteAnimal(animalTag: animalTag);
  }
}
