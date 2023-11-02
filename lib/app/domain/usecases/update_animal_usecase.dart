import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class UpdateAnimalUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  UpdateAnimalUsecase({required this.repositoryInterface});

  Future<void> call({required AnimalEntity animal}) async {
    return repositoryInterface.updateAnimal(animal: animal);
  }
}
