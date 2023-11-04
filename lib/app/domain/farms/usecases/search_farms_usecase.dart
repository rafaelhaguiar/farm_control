import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/domain/farms/repository/farm_repository.dart';

final class SearchFarmsUsecase {
  final FarmRepositoryInterface repositoryInterface;

  SearchFarmsUsecase({required this.repositoryInterface});

  Future<List<FarmEntity>> call() async {
    return repositoryInterface.searchFarms();
  }
}
