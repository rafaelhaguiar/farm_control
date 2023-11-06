import 'package:farm_control/app/data/animals/datasource/animal_datasource.dart';
import 'package:farm_control/app/data/animals/model/animal_model.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:mocktail/mocktail.dart';

final class MockAnimalRepository extends Mock
    implements AnimalRepositoryInterface {}

final class MockAnimalDatasource extends Mock
    implements AnimalDatasourceInterface {}

final class MockAnimalEntity extends Mock implements AnimalEntity {}

const AnimalModel animalModelMock =
    AnimalModel(animalId: 1, animalTag: '001234741235678', farmId: 1);

final class MockFarmEntity extends Mock implements FarmEntity {}
