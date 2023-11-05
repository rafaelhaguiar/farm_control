import 'package:farm_control/app/data/animals/model/animal_model.dart';
import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/animal/blocs/delete/bloc/delete_animal_bloc.dart';
import 'package:farm_control/app/presenter/animal/blocs/update/bloc/update_animal_bloc.dart';
import 'package:farm_control/app/presenter/home/bloc/home_bloc.dart';
import 'package:farm_control/app/presenter/search/bloc/search_animal_bloc.dart';
import 'package:farm_control/app/shared/utils/extensions.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:farm_control/config/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  late final GlobalKey<FormState> _updateFormKey;
  late final TextEditingController _updateAnimalTagController;
  late final DeleteAnimalBloc _deleteBloc;
  late final UpdateAnimalBloc _updateBloc;
  AnimalEntity? _animalEntity;

  @override
  void initState() {
    _updateFormKey = GlobalKey<FormState>();
    _deleteBloc = appContainer.get<DeleteAnimalBloc>();
    _updateBloc = appContainer.get<UpdateAnimalBloc>();
    _updateAnimalTagController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _animalEntity ??= map['animal'] as AnimalEntity;
    FarmEntity farmEntity = map['farm'] as FarmEntity;
    _updateAnimalTagController.text = _animalEntity!.animalTag;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Gerenciar Animal'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.popUntil(
                    context, ModalRoute.withName(RouteUrl.home.url)),
                icon: const Icon(Icons.home))
          ]),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DeleteAnimalBloc, DeleteAnimalState>(
            bloc: _deleteBloc,
            listener: (context, state) {
              if (state is DeleteAnimalSuccess) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeEvent(farmEntity.farmId));

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 184, 214, 185),
                    title: const Text(
                      'Exclusão realizada',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text('Animal excluido com sucesso!'),
                    actions: [
                      InkWell(
                          onTap: () {
                            Navigator.popUntil(context,
                                ModalRoute.withName(RouteUrl.search.url));
                          },
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              color: Color.fromARGB(255, 31, 31, 31),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                );
              }
              if (state is DeleteAnimalError) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 213, 121, 121),
                    title: const Text(
                      'Erro ao excluir',
                      textAlign: TextAlign.center,
                    ),
                    content:
                        const Text('Erro ao excluir animal, tente novamente!'),
                    actions: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Fechar',
                            style: TextStyle(
                              color: Color.fromARGB(255, 31, 31, 31),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                );
              }
            },
          ),
          BlocListener<UpdateAnimalBloc, UpdateAnimalState>(
            bloc: _updateBloc,
            listener: (context, state) {
              if (state is UpdateAnimalSuccess) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 184, 214, 185),
                    title: const Text(
                      'Atualização realizada',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text('Atualização realizada com sucesso!'),
                    actions: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              color: Color.fromARGB(255, 31, 31, 31),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                );
              }
              if (state is UpdateAnimalError) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 213, 121, 121),
                    title: const Text(
                      'Erro ao atualizar',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                        'Erro ao atualizar animal, tente novamente!'),
                    actions: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Fechar',
                            style: TextStyle(
                              color: Color.fromARGB(255, 31, 31, 31),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<UpdateAnimalBloc, UpdateAnimalState>(
          bloc: _updateBloc,
          builder: (context, state) {
            if (state is UpdateAnimalLoading) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }
            return BlocBuilder<DeleteAnimalBloc, DeleteAnimalState>(
              bloc: _deleteBloc,
              builder: (context, state) {
                if (state is DeleteAnimalLoading) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  );
                }
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(
                                text: 'ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: _animalEntity!.animalId.toString()),
                          ])),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(
                                text: 'TAG: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: _animalEntity!.animalTag),
                          ])),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(
                                text: 'FARM ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: _animalEntity!.farmId.toString()),
                          ])),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(
                                text: 'FARM: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: farmEntity.farmName),
                          ])),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 39, 39, 39),
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text('Alterar TAG',
                          textAlign: TextAlign.center),
                      actionsPadding: const EdgeInsets.all(20),
                      content: Form(
                        key: _updateFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      const TextSpan(
                                        text: 'Tag atual: ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: _animalEntity!.animalTag,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])),
                            TextFormField(
                              controller: _updateAnimalTagController,
                              validator: (value) {
                                if (!(value ?? "").animalTagIsValid()) {
                                  return 'A tag precisa ter 15 caracteres e todos eles precisam ser números';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(hintText: 'Nova TAG'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              if (_updateFormKey.currentState!.validate()) {
                                AnimalModel animalModel =
                                    _animalEntity as AnimalModel;
                                _animalEntity = animalModel.copyWith(
                                    animalTag: _updateAnimalTagController.text);
                                Navigator.pop(context);
                                _updateBloc.add(UpdateAnimalEvent(
                                    animalEntity: _animalEntity!));
                                BlocProvider.of<SearchAnimalBloc>(context).add(
                                    SearchAnimalEvent(
                                        args: '', farmId: farmEntity.farmId));
                              }
                            },
                            child: const Text(
                              'Salvar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: 50,
                  color: Colors.yellow[800],
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text('Alterar TAG',
                          textAlign: TextAlign.center),
                      actionsPadding: const EdgeInsets.all(20),
                      content: const Text('Deseja realmente deletar?'),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              _deleteBloc.add(DeleteAnimalEvent(
                                  animalId: _animalEntity!.animalId));
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Deletar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 31, 31, 31),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 50,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
