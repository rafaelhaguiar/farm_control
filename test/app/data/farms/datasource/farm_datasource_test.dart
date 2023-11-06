import 'package:farm_control/app/data/farms/datasource/farm_datasource.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements StorageInterface {}

void main() {
  late final StorageInterface storage;
  late final FarmDatasourceInterface datasource;

  setUpAll(() {
    storage = MockStorage();
    datasource = FarmDatasourceImpl(storage: storage);
  });

  test(
      'FarmDatasource: Should return a list of farm when datasource is success',
      () async {
    when(() => storage.get(query: any(named: 'query')))
        .thenAnswer((_) async => [
              {"farm_id": 1, "farm_name": "farm"}
            ]);
    expect(await datasource.searchFarms(), isA<List<FarmEntity>>());

    verify(() => storage.get(query: any(named: 'query'))).called(1);
  });

  test(
      'FarmDatasource: Should return a empty list datasource is success but dont find data',
      () async {
    when(() => storage.get(query: any(named: 'query')))
        .thenAnswer((_) async => []);
    expect(await datasource.searchFarms(), isA<List<FarmEntity>>());

    verify(() => storage.get(query: any(named: 'query'))).called(1);
  });
  test('FarmDatasource: Should return a CacheException on error', () async {
    when(() => storage.get(query: any(named: 'query')))
        .thenThrow(CacheException());
    expect(datasource.searchFarms(), throwsA(isA<CacheException>()));

    verify(() => storage.get(query: any(named: 'query'))).called(1);
  });
}
