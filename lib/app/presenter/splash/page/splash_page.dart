import 'package:farm_control/app/data/model/animal_model.dart';
import 'package:farm_control/app/domain/usecases/delete_animal_usecase.dart';
import 'package:farm_control/app/domain/usecases/save_animals_usecase.dart';
import 'package:farm_control/app/domain/usecases/search_animal_usecase.dart';
import 'package:farm_control/app/domain/usecases/update_animal_usecase.dart';
import 'package:farm_control/app/shared/storage/sqlite_helper.dart';
import 'package:farm_control/config/container.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final db = await SqliteHelper.instance;

                  final result1 = await db.rawQuery('SELECT * FROM farms');
                  print(result1);
                  final result2 = await db.rawQuery('SELECT * FROM animals');
                  print(result2);
                },
                child: const Text('Buscar gerais')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  appContainer
                      .get<SaveAnimalsUsecase>()
                      .call(animalsList: const [
                    SaveAnimalsUsecaseParams(animalTag: '1', farmId: 1),
                    SaveAnimalsUsecaseParams(animalTag: '2', farmId: 1),
                    SaveAnimalsUsecaseParams(animalTag: '3', farmId: 2),
                  ]);
                },
                child: const Text('Salvar no banco')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final result = await appContainer
                      .get<SearchAnimalsUsecase>()
                      .call(args: '3');
                  print(result);
                },
                child: const Text('Buscar no banco')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  appContainer.get<UpdateAnimalUsecase>().call(
                      animal:
                          AnimalModel(animalId: 2, animalTag: '2', farmId: 2));
                },
                child: const Text('Atualizar no banco')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  appContainer.get<DeletaAnimalUsecase>().call(animalId: 1);
                },
                child: const Text('Deletar no banco')),
          ),
        ],
      ),
    );
  }
}
