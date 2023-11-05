import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';

final class GetAmountAnimalsUsecase {
  final AnimalRepositoryInterface repositoryInterface;

  GetAmountAnimalsUsecase({required this.repositoryInterface});

  Future<int> call({required int farmId}) async {
    return repositoryInterface.getAmountAnimals(farmId: farmId);
  }
}
