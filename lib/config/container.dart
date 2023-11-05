import 'package:farm_control/app/data/animals/datasource/animal_datasource.dart';
import 'package:farm_control/app/data/animals/repository/animal_repository_impl.dart';
import 'package:farm_control/app/data/farms/datasource/farm_datasource.dart';
import 'package:farm_control/app/data/farms/repository/farm_repository_impl.dart';
import 'package:farm_control/app/domain/animals/repository/animal_repository.dart';
import 'package:farm_control/app/domain/animals/usecases/delete_animal_usecase.dart';
import 'package:farm_control/app/domain/animals/usecases/get_amount_animals_usecase.dart';
import 'package:farm_control/app/domain/animals/usecases/save_animals_usecase.dart';
import 'package:farm_control/app/domain/animals/usecases/search_animal_usecase.dart';
import 'package:farm_control/app/domain/animals/usecases/update_animal_usecase.dart';
import 'package:farm_control/app/domain/farms/repository/farm_repository.dart';
import 'package:farm_control/app/domain/farms/usecases/search_farms_usecase.dart';
import 'package:farm_control/app/presenter/animal/blocs/delete/bloc/delete_animal_bloc.dart';
import 'package:farm_control/app/presenter/animal/blocs/update/bloc/update_animal_bloc.dart';
import 'package:farm_control/app/presenter/create/bloc/create_animal_bloc.dart';
import 'package:farm_control/app/presenter/home/bloc/home_bloc.dart';
import 'package:farm_control/app/presenter/search/bloc/search_animal_bloc.dart';
import 'package:farm_control/app/presenter/farm/bloc/farm_bloc.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';
import 'package:farm_control/app/shared/storage/storage_sqlite_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final appContainer = GetIt.instance;

void initAppContainer({required Database database}) {
  appContainer.registerLazySingleton(() => database);

  appContainer.registerLazySingleton<StorageInterface>(
      () => StorageSqliteImpl(appContainer<Database>()));

  //Farm domain dependencies
  appContainer.registerLazySingleton<FarmDatasourceInterface>(
      () => FarmDatasourceImpl(storage: appContainer<StorageInterface>()));
  appContainer.registerLazySingleton<FarmRepositoryInterface>(() =>
      FarmRepositoryImpl(datasource: appContainer<FarmDatasourceInterface>()));

  appContainer.registerLazySingleton<SearchFarmsUsecase>(() =>
      SearchFarmsUsecase(
          repositoryInterface: appContainer<FarmRepositoryInterface>()));
  appContainer.registerFactory<FarmBloc>(
      () => FarmBloc(searchUsecase: appContainer<SearchFarmsUsecase>()));

  //Animal domain dependencies
  appContainer.registerLazySingleton<AnimalDatasourceInterface>(
      () => AnimalDatasourceImpl(storage: appContainer<StorageInterface>()));
  appContainer.registerLazySingleton<AnimalRepositoryInterface>(() =>
      AnimalRepositoryImpl(
          datasource: appContainer<AnimalDatasourceInterface>()));
  appContainer.registerLazySingleton<SaveAnimalsUsecase>(() =>
      SaveAnimalsUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));
  appContainer.registerLazySingleton<SearchAnimalsUsecase>(() =>
      SearchAnimalsUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));
  appContainer.registerLazySingleton<UpdateAnimalUsecase>(() =>
      UpdateAnimalUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));
  appContainer.registerLazySingleton<DeleteAnimalUsecase>(() =>
      DeleteAnimalUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));

  appContainer.registerLazySingleton<GetAmountAnimalsUsecase>(() =>
      GetAmountAnimalsUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));
  appContainer.registerFactory<SearchAnimalBloc>(
      () => SearchAnimalBloc(usecase: appContainer<SearchAnimalsUsecase>()));
  appContainer.registerFactory<CreateAnimalBloc>(
      () => CreateAnimalBloc(usecase: appContainer<SaveAnimalsUsecase>()));
  appContainer.registerFactory<DeleteAnimalBloc>(
      () => DeleteAnimalBloc(usecase: appContainer<DeleteAnimalUsecase>()));
  appContainer.registerFactory<UpdateAnimalBloc>(
      () => UpdateAnimalBloc(usecase: appContainer<UpdateAnimalUsecase>()));
  appContainer.registerFactory<HomeBloc>(
      () => HomeBloc(usecase: appContainer<GetAmountAnimalsUsecase>()));
}
