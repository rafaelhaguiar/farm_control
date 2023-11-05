import 'package:equatable/equatable.dart';
import 'package:farm_control/app/domain/animals/usecases/get_amount_animals_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAmountAnimalsUsecase usecase;
  HomeBloc({required this.usecase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        final amount = await usecase(farmId: event.farmId);
        emit(HomeSuccess(amount: amount));
      } on Exception {
        emit(HomeError());
      }
    });
  }
}
