import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/domain/farms/usecases/search_farms_usecase.dart';

part 'farm_event.dart';
part 'farm_state.dart';

class FarmBloc extends Bloc<FarmEvent, FarmState> {
  final SearchFarmsUsecase searchUsecase;

  FarmBloc({required this.searchUsecase}) : super(FarmInitial()) {
    on<GetFarmsEvent>((event, emit) async {
      try {
        emit(FarmLoading());
        final getResult = await searchUsecase();
        switch (getResult.length) {
          case > 0:
            emit(FarmSuccess<List<FarmEntity>>(data: getResult));
            break;
          default:
            emit(const FarmSuccess<void>(data: null));
        }
      } catch (e) {
        emit(FarmError());
      }
    });
  }
}
