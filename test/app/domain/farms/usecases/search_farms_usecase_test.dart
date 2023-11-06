import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/domain/farms/repository/farm_repository.dart';
import 'package:farm_control/app/domain/farms/usecases/search_farms_usecase.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/mocks.dart';

class MockFarmRepository extends Mock implements FarmRepositoryInterface {}

void main() {
  late final FarmRepositoryInterface repository;
  late final SearchFarmsUsecase usecase;

  setUpAll(() {
    repository = MockFarmRepository();
    usecase = SearchFarmsUsecase(repositoryInterface: repository);
  });
  test('SearchFarmsUsecase: When success should return a farm list', () async {
    when(() => repository.searchFarms())
        .thenAnswer((_) async => <FarmEntity>[MockFarmEntity()]);

    expect(await usecase(), isA<List<FarmEntity>>());
    verify(() => repository.searchFarms()).called(1);
  });

  test('SearchFarmsUsecase: When error should return a Cache Exception',
      () async {
    when(() => repository.searchFarms()).thenThrow(CacheException());

    expect(usecase(), throwsA(isA<CacheException>()));
    verify(() => repository.searchFarms()).called(1);
  });
}
