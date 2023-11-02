import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class SearchForASingleAnimalUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  SearchForASingleAnimalUsecase({required this.repositoryInterface});

  Future<AnimalEntity?> call({required int animalTag}) async {
    return repositoryInterface.searchForASingleAnimal(animalTag: animalTag);
  }
}
