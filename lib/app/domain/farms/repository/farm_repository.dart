import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';

abstract interface class FarmRepositoryInterface {
  Future<List<FarmEntity>> searchFarms();
}
