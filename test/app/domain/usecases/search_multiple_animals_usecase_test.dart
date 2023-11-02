import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/search_multiple_animals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SearchMultipleAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase =
        SearchMultipleAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test(
      'SearchMultipleAnimalsUsecase: When success need return a AnimalEntity list',
      () async {
    when(() => repositoryInterface.searchMultipleAnimals())
        .thenAnswer((_) async => <AnimalEntity>[MockAnimalEntity()]);
    expectLater(await usecase(), isA<List<AnimalEntity>>());
    verify(() => repositoryInterface.searchMultipleAnimals()).called(1);
  });

  test('SearchMultipleAnimalsUsecase: When error need return a Exception',
      () async {
    when(() => repositoryInterface.searchMultipleAnimals())
        .thenThrow(Exception());
    expect(() => usecase(), throwsA(isA<Exception>()));
  });
}
