part of 'farm_bloc.dart';

sealed class FarmEvent extends Equatable {
  const FarmEvent();

  @override
  List<Object> get props => [];
}

final class GetFarmsEvent extends FarmEvent {}

final class CreateFarmEvent extends FarmEvent {
  final String farmName;
  const CreateFarmEvent({required this.farmName});
}

final class SelectOneFarm extends FarmEvent {
  final FarmEntity farmEntity;
  const SelectOneFarm({required this.farmEntity});
}
