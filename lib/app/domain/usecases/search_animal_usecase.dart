import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';

final class SearchAnimalsUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  SearchAnimalsUsecase({required this.repositoryInterface});

  Future<List<AnimalEntity>> call({required String args}) async {
    return repositoryInterface.searchAnimals(args: args);
  }
}
