import 'dart:ffi';

import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/domain/animals/usecases/save_animals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/mocks.dart';

void main() {
  late AnimalRepositoryInterface repositoryInterface;
  late SaveAnimalsUsecase usecase;
  setUpAll(() {
    repositoryInterface = MockAnimalRepository();
    usecase = SaveAnimalsUsecase(repositoryInterface: repositoryInterface);
  });
  test('SaveAnimalsUsecase: When success need return a void', () async {
    when(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).thenAnswer((_) async => Void);
    await usecase(animalsList: [
      const SaveAnimalsUsecaseParams(animalTag: '000012485123475', farmId: 1)
    ]);
    verify(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).called(1);
  });

  test('SaveAnimalsUsecase: When error need return a Exception', () async {
    when(() => repositoryInterface.saveAnimals(
        animalsList: any(named: 'animalsList'))).thenThrow(Exception());
    expect(
        () => usecase(animalsList: const [
              SaveAnimalsUsecaseParams(animalTag: '000012485123475', farmId: 1)
            ]),
        throwsA(isA<Exception>()));
  });

  test('SaveAnimalsUsecase: test equality in SaveAnimalsUsecaseParams', () {
    const params =
        SaveAnimalsUsecaseParams(animalTag: '00127412563214', farmId: 1);
    const paramsEqual =
        SaveAnimalsUsecaseParams(animalTag: '00127412563214', farmId: 1);
    const paramsDiffernt =
        SaveAnimalsUsecaseParams(animalTag: '11127412563214', farmId: 2);
    expect(params == paramsEqual, equals(true));
    expect(params == paramsDiffernt, equals(false));
  });
}
