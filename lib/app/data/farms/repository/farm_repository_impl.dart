import 'package:farm_control/app/data/farms/datasource/farm_datasource.dart';

import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/domain/farms/repository/farm_repository.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';

final class FarmRepositoryImpl implements FarmRepositoryInterface {
  final FarmDatasourceInterface datasource;
  FarmRepositoryImpl({required this.datasource});

  @override
  Future<List<FarmEntity>> searchFarms() async {
    try {
      return await datasource.searchFarms();
    } on Exception {
      throw CacheException();
    }
  }
}
