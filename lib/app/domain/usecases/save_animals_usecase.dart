import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class SaveAnimalsUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  SaveAnimalsUsecase({required this.repositoryInterface});

  Future<void> call({required List<AnimalEntity> animalsList}) async {
    return repositoryInterface.saveAnimals(animalsList: animalsList);
  }
}
