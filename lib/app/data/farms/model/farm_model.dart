import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';

final class FarmModel extends FarmEntity {
  FarmModel({required super.farmId, required super.farmName});

  FarmModel copyWith({
    int? farmId,
    String? farmName,
  }) =>
      FarmModel(
        farmId: farmId ?? this.farmId,
        farmName: farmName ?? this.farmName,
      );

  Map<String, dynamic> toMap() => {
        'farm_id': farmId,
        'farm_name': farmName,
      };

  factory FarmModel.fromMap({required Map<String, dynamic> map}) => FarmModel(
        farmId: map['farm_id'],
        farmName: map['farm_name'],
      );
}
