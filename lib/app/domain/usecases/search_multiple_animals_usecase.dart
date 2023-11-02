import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class SearchMultipleAnimalsUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  SearchMultipleAnimalsUsecase({required this.repositoryInterface});

  Future<List<AnimalEntity>> call({String? filterArgs}) async {
    return repositoryInterface.searchMultipleAnimals(filterArgs: filterArgs);
  }
}
