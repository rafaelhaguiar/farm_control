import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/search_animal_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SearchAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = SearchAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test('SearchAnimalsUsecase: When success need return a AnimalEntity list',
      () async {
    when(() => repositoryInterface.searchAnimals(args: any(named: 'args')))
        .thenAnswer((_) async => [MockAnimalEntity()]);
    expectLater(await usecase(args: 'arg'), isA<List<AnimalEntity>>());
    verify(() => repositoryInterface.searchAnimals(args: any(named: 'args')))
        .called(1);
  });

  test('SearchMultipleAnimalsUsecase: When error need return a Exception',
      () async {
    when(() => repositoryInterface.searchAnimals(args: any(named: 'args')))
        .thenThrow(Exception());
    expect(() => usecase(args: 'args'), throwsA(isA<Exception>()));
  });
}
