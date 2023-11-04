import 'package:farm_control/app/data/datasource/animal_datasource.dart';
import 'package:farm_control/app/data/repository/animal_repository_impl.dart';
import 'package:farm_control/app/domain/repository/animal_repository.dart';
import 'package:farm_control/app/domain/usecases/delete_animal_usecase.dart';
import 'package:farm_control/app/domain/usecases/save_animals_usecase.dart';
import 'package:farm_control/app/domain/usecases/search_animal_usecase.dart';
import 'package:farm_control/app/domain/usecases/update_animal_usecase.dart';
import 'package:farm_control/app/shared/storage/storage_interface.dart';
import 'package:farm_control/app/shared/storage/storage_sqlite_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final appContainer = GetIt.instance;

void initAppContainer({required Database database}) {
  appContainer.registerLazySingleton(() => database);

  appContainer.registerLazySingleton<StorageInterface>(
      () => StorageSqliteImpl(appContainer<Database>()));

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
  appContainer.registerLazySingleton<DeletaAnimalUsecase>(() =>
      DeletaAnimalUsecase(
          repositoryInterface: appContainer<AnimalRepositoryInterface>()));
}
