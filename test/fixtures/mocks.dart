import 'package:farm_control/app/data/datasource/animal_datasource.dart';
import 'package:farm_control/app/data/model/animal_model.dart';
import 'package:farm_control/app/domain/entity/animal_entity.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:mocktail/mocktail.dart';

final class MockAnimalRepository extends Mock
    implements AnimalRepositoryInterface {}

final class MockAnimalDatasource extends Mock
    implements AnimalDatasourceInterface {}

final class MockAnimalEntity extends Mock implements AnimalEntity {}

const AnimalModel animalModelMock =
    AnimalModel(animalId: 1, animalTag: '001234741235678', farmId: 1);
