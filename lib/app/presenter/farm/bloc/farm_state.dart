part of 'farm_bloc.dart';

sealed class FarmState extends Equatable {
  const FarmState();

  @override
  List<Object> get props => [];
}

final class FarmInitial extends FarmState {}

final class FarmSuccess<T> extends FarmState {
  final T data;

  const FarmSuccess({required this.data});
}

final class FarmLoading extends FarmState {}

final class FarmError extends FarmState {}
