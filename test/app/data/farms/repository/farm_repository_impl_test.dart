import 'package:farm_control/app/data/farms/datasource/farm_datasource.dart';
import 'package:farm_control/app/data/farms/repository/farm_repository_impl.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/domain/farms/repository/farm_repository.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/mocks.dart';

class MockFarmDatasource extends Mock implements FarmDatasourceInterface {}

void main() {
  late final FarmDatasourceInterface datasource;
  late final FarmRepositoryInterface repository;

  setUpAll(() {
    datasource = MockFarmDatasource();
    repository = FarmRepositoryImpl(datasource: datasource);
  });
  test('FarmRepository: When success should return a list of farms entities',
      () async {
    when(() => datasource.searchFarms())
        .thenAnswer((_) async => <FarmEntity>[MockFarmEntity()]);
    expect(await repository.searchFarms(), isA<List<FarmEntity>>());
  });
  test('FarmRepository: When error should return a CacheException', () async {
    when(() => datasource.searchFarms()).thenThrow(CacheException());
    expect(repository.searchFarms(), throwsA(isA<CacheException>()));
  });
}
