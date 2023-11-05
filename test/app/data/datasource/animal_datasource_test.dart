import 'dart:ffi';

import 'package:farm_control/app/data/animals/datasource/animal_datasource.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/shared/errors/app_exceptions.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/mocks.dart';

class MockStorage extends Mock implements StorageInterface {}

void main() {
  late final StorageInterface storage;
  late final AnimalDatasourceInterface datasource;

  setUpAll(() {
    storage = MockStorage();
    datasource = AnimalDatasourceImpl(storage: storage);
    registerFallbackValue(Tabs.animals);
  });
  group('AnimalDatasourceImpl: deleteAnimal tests', () {
    test(
        'AnimalDatasourceImpl: Should be success when delete an Animal and return 1',
        () async {
      when(() => storage.delete(
          table: any(named: 'table'),
          idFieldName: any(named: 'idFieldName'),
          id: any(named: 'id'))).thenAnswer((_) async => 1);
      expect(await datasource.deleteAnimal(animalId: 1), equals(1));
      verify(() => storage.delete(
          table: any(named: 'table'),
          idFieldName: any(named: 'idFieldName'),
          id: any(named: 'id'))).called(1);
    });

    test(
        'AnimalDatasourceImpl: On deleteAnimal exception the exception must be a CacheException',
        () async {
      when(() => storage.delete(
          table: any(named: 'table'),
          idFieldName: any(named: 'idFieldName'),
          id: any(named: 'id'))).thenThrow(CacheException());
      expect(() => datasource.deleteAnimal(animalId: 1),
          throwsA(isA<CacheException>()));
      verify(() => storage.delete(
          table: any(named: 'table'),
          idFieldName: any(named: 'idFieldName'),
          id: any(named: 'id'))).called(1);
    });
  });
  group('AnimalDatasourceImpl: saveAnimals tests', () {
    test('AnimalDatasourceImpl: Should be success when try save animal list',
        () async {
      when(() => storage.save(
          table: any(named: 'table'),
          list: any(named: 'list'))).thenAnswer((_) async => Void);
      await datasource.saveAnimals(animalList: [
        {'animal_tag': '000321456789654', 'farm_id': 1}
      ]);
      verify(() => storage.save(
          table: any(named: 'table'), list: any(named: 'list'))).called(1);
    });

    test(
        'AnimalDatasourceImpl: Should return a CacheException when have a exception trying save animals',
        () async {
      when(() => storage.save(
          table: any(named: 'table'),
          list: any(named: 'list'))).thenThrow(CacheException());
      expect(
          () => datasource.saveAnimals(animalList: [
                {'animal_tag': '000321456789654', 'farm_id': 1}
              ]),
          throwsA(isA<CacheException>()));
      verify(() => storage.save(
          table: any(named: 'table'), list: any(named: 'list'))).called(1);
    });
  });
  group('AnimalDatasourceImpl: updateAnimal tests', () {
    test('AnimalDatasourceImpl: Should be success when update an Animal',
        () async {
      when(() => storage.update(
            table: any(named: 'table'),
            idFieldName: any(named: 'idFieldName'),
            id: any(named: 'id'),
            updateData: any(named: 'updateData'),
          )).thenAnswer((_) async => Void);
      await datasource.updateAnimal(animal: animalModelMock);
      verify(() => storage.update(
            table: any(named: 'table'),
            idFieldName: any(named: 'idFieldName'),
            id: any(named: 'id'),
            updateData: any(named: 'updateData'),
          )).called(1);
    });

    test(
        'AnimalDatasourceImpl: On updateAnimal exception the exception must be a CacheException',
        () async {
      when(() => storage.update(
            table: any(named: 'table'),
            idFieldName: any(named: 'idFieldName'),
            id: any(named: 'id'),
            updateData: any(named: 'updateData'),
          )).thenThrow(CacheException());
      expect(() => datasource.updateAnimal(animal: animalModelMock),
          throwsA(isA<CacheException>()));
      verify(() => storage.update(
            table: any(named: 'table'),
            idFieldName: any(named: 'idFieldName'),
            id: any(named: 'id'),
            updateData: any(named: 'updateData'),
          )).called(1);
    });
  });
  group('AnimalDatasourceImpl: searchAnimals tests', () {
    test(
        'AnimalDatasourceImpl: Should be success when search an Animal and return a not empty List',
        () async {
      when(() => storage.get(query: any(named: 'query')))
          .thenAnswer((_) async => [
                {'animal_id': 1, 'animal_tag': '000321456789654', 'farm_id': 1}
              ]);
      final notEmptySearchResult =
          await datasource.searchAnimals(args: 'anyArgs', farmId: 1);
      expect(notEmptySearchResult, isA<List<AnimalEntity>>());
      expect(notEmptySearchResult.isEmpty, equals(false));
      verify(() => storage.get(query: any(named: 'query'))).called(1);
    });
    test(
        'AnimalDatasourceImpl: Should be success when search an Animal and return an  empty List',
        () async {
      when(() => storage.get(query: any(named: 'query')))
          .thenAnswer((_) async => []);

      final emptySearchResult =
          await datasource.searchAnimals(args: 'anyArgs', farmId: 1);
      expect(emptySearchResult, isA<List<AnimalEntity>>());
      expect(emptySearchResult.isEmpty, equals(true));
      verify(() => storage.get(query: any(named: 'query'))).called(1);
    });
    test(
        'AnimalDatasourceImpl: On search animal exception the exception must be a CacheException',
        () async {
      when(() => storage.get(query: any(named: 'query')))
          .thenThrow(CacheException());
      expect(() => datasource.searchAnimals(args: 'anyArgs', farmId: 1),
          throwsA(isA<CacheException>()));
      verify(() => storage.get(query: any(named: 'query'))).called(1);
    });
  });

  group('AnimalDatasourceImpl: getAmount tests', () {
    test(
        'AnimalDatasourceImpl: Should be success when getAmount an Animal and return 1',
        () async {
      when(() => storage.get(query: any(named: 'query')))
          .thenAnswer((_) async => [{}]);
      expect(await datasource.getAmountAnimals(farmId: 1), equals(1));
      verify(() => storage.get(query: any(named: 'query'))).called(1);
    });

    test(
        'AnimalDatasourceImpl: On getAmount exception the exception must be a CacheException',
        () async {
      when(() => storage.get(query: any(named: 'query')))
          .thenThrow(CacheException());
      expect(() => datasource.getAmountAnimals(farmId: 1),
          throwsA(isA<CacheException>()));
      verify(() => storage.get(query: any(named: 'query'))).called(1);
    });
  });
}
