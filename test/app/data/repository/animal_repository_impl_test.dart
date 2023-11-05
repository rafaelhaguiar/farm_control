import 'dart:ffi';

import 'package:farm_control/app/data/animals/datasource/animal_datasource.dart';
import 'package:farm_control/app/data/animals/repository/animal_repository_impl.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

class MockAnimalDatasourceInterface extends Mock
    implements AnimalDatasourceInterface {}

void main() {
  late final AnimalDatasourceInterface datasource;
  late final AnimalRepositoryInterface repository;

  setUpAll(() {
    datasource = MockAnimalDatasourceInterface();
    repository = AnimalRepositoryImpl(datasource: datasource);
  });
  group('AnimalRepositoryImpl: deleteAnimal tests', () {
    test('AnimalRepositoryImpl: Should return 1 when delete is success',
        () async {
      when(() => datasource.deleteAnimal(animalId: any(named: 'animalId')))
          .thenAnswer((_) async => 1);
      expect(await repository.deleteAnimal(animalId: 597), equals(1));
      verify(() => datasource.deleteAnimal(animalId: any(named: 'animalId')))
          .called(1);
    });

    test(
        'AnimalRepositoryImpl: Should return a CacheException on any Exception in delete',
        () async {
      when(() => datasource.deleteAnimal(animalId: any(named: 'animalId')))
          .thenThrow(Exception());
      expect(() => repository.deleteAnimal(animalId: 597),
          throwsA(isA<CacheException>()));
      verify(() => datasource.deleteAnimal(animalId: any(named: 'animalId')))
          .called(1);
    });
  });

  group('AnimalRepositoryImpl: searchAnimals tests', () {
    test(
        'AnimalRepositoryImpl: Should return a List<AnimalEntity> when searchAnimals is success',
        () async {
      when(() => datasource.searchAnimals(
              args: any(named: 'args'), farmId: any(named: 'farmId')))
          .thenAnswer((_) async => <AnimalEntity>[MockAnimalEntity()]);
      expect(await repository.searchAnimals(args: 'args', farmId: 1),
          isA<List<AnimalEntity>>());
      verify(() => datasource.searchAnimals(
          args: any(named: 'args'), farmId: any(named: 'farmId'))).called(1);
    });

    test(
        'AnimalRepositoryImpl: Should return a CacheException on any Exception in search',
        () async {
      when(() => datasource.searchAnimals(
          args: any(named: 'args'),
          farmId: any(named: 'farmId'))).thenThrow(Exception());
      expect(() => repository.searchAnimals(args: 'args', farmId: 1),
          throwsA(isA<CacheException>()));
      verify(() => datasource.searchAnimals(
          args: any(named: 'args'), farmId: any(named: 'farmId'))).called(1);
    });
  });

  group('AnimalRepositoryImpl: saveAnimals tests', () {
    test('AnimalRepositoryImpl: Should be a success call saveAnimals',
        () async {
      when(() => datasource.saveAnimals(animalList: [animalModelMock.toMap()]))
          .thenAnswer((_) async => Void);

      await repository.saveAnimals(animalsList: [animalModelMock.toMap()]);
      verify(() =>
              datasource.saveAnimals(animalList: [animalModelMock.toMap()]))
          .called(1);
    });

    test(
        'AnimalRepositoryImpl: Should return a CacheException on any Exception in saveAnimals',
        () async {
      when(() => datasource.saveAnimals(animalList: [animalModelMock.toMap()]))
          .thenThrow(Exception());
      expect(
          () => repository.saveAnimals(animalsList: [animalModelMock.toMap()]),
          throwsA(isA<CacheException>()));
      verify(() =>
              datasource.saveAnimals(animalList: [animalModelMock.toMap()]))
          .called(1);
    });
  });

  group('AnimalRepositoryImpl: updateAnimal tests', () {
    test('AnimalRepositoryImpl: Should be a success call updateAnimal',
        () async {
      when(() => datasource.updateAnimal(animal: animalModelMock))
          .thenAnswer((_) async => Void);

      await repository.updateAnimal(animal: animalModelMock);
      verify(() => datasource.updateAnimal(animal: animalModelMock)).called(1);
    });

    test(
        'AnimalRepositoryImpl: Should return a CacheException on any Exception in updateAnimal',
        () async {
      when(() => datasource.updateAnimal(animal: animalModelMock))
          .thenThrow(Exception());
      expect(() => repository.updateAnimal(animal: animalModelMock),
          throwsA(isA<CacheException>()));
      verify(() => datasource.updateAnimal(animal: animalModelMock)).called(1);
    });
  });

  group('AnimalRepositoryImpl: getAmount tests', () {
    test('AnimalRepositoryImpl: Should return 1 when getAmount is success',
        () async {
      when(() => datasource.getAmountAnimals(farmId: any(named: 'farmId')))
          .thenAnswer((_) async => 1);
      expect(await repository.getAmountAnimals(farmId: 597), equals(1));
      verify(() => datasource.getAmountAnimals(farmId: any(named: 'farmId')))
          .called(1);
    });

    test(
        'AnimalRepositoryImpl: Should return a CacheException on any Exception in farmId',
        () async {
      when(() => datasource.getAmountAnimals(farmId: any(named: 'farmId')))
          .thenThrow(Exception());
      expect(() => repository.getAmountAnimals(farmId: 597),
          throwsA(isA<CacheException>()));
      verify(() => datasource.getAmountAnimals(farmId: any(named: 'farmId')))
          .called(1);
    });
  });
}
