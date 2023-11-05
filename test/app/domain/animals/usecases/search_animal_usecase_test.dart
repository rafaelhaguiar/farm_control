import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/domain/animals/usecases/search_animal_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SearchAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = SearchAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test('SearchAnimalsUsecase: When success need return a AnimalEntity list',
      () async {
    when(() => repositoryInterface.searchAnimals(
            args: any(named: 'args'), farmId: any(named: 'farmId')))
        .thenAnswer((_) async => [MockAnimalEntity()]);
    expectLater(
        await usecase(args: 'arg', farmId: 1), isA<List<AnimalEntity>>());
    verify(() => repositoryInterface.searchAnimals(
        args: any(named: 'args'), farmId: any(named: 'farmId'))).called(1);
  });

  test('SearchMultipleAnimalsUsecase: When error need return a Exception',
      () async {
    when(() => repositoryInterface.searchAnimals(
        args: any(named: 'args'),
        farmId: any(named: 'farmId'))).thenThrow(Exception());
    expect(() => usecase(args: 'args', farmId: 1), throwsA(isA<Exception>()));
  });
}
