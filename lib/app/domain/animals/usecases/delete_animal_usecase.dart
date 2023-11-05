import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';

final class DeleteAnimalUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  DeleteAnimalUsecase({required this.repositoryInterface});

  Future<int> call({required int animalId}) async {
    return repositoryInterface.deleteAnimal(animalId: animalId);
  }
}
