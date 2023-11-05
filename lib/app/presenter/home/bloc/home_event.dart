part of 'home_bloc.dart';

final class HomeEvent extends Equatable {
  final int farmId;
  const HomeEvent(this.farmId);

  @override
  List<Object> get props => [farmId];
}
