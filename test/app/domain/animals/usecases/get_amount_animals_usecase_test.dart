import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/domain/animals/usecases/get_amount_animals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late GetAmountAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = GetAmountAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test('GetAmountAnimalsUsecase: When success need return a int', () async {
    when(() =>
            repositoryInterface.getAmountAnimals(farmId: any(named: 'farmId')))
        .thenAnswer((_) async => 1);
    final result = await usecase(farmId: 1234567);
    expect(result, isA<int>());
    verify(() =>
            repositoryInterface.getAmountAnimals(farmId: any(named: 'farmId')))
        .called(1);
  });

  test('GetAmountAnimalsUsecase: When error need return a Exception', () async {
    when(() =>
            repositoryInterface.getAmountAnimals(farmId: any(named: 'farmId')))
        .thenThrow(Exception());
    expect(() => usecase(farmId: 1234567), throwsA(isA<Exception>()));
  });
}
