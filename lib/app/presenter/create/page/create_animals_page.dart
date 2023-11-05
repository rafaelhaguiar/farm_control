import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/create/bloc/create_animal_bloc.dart';
import 'package:farm_control/app/presenter/create/controller/list_notifier_controller.dart';
import 'package:farm_control/app/presenter/create/widgets/create_card_widget.dart';
import 'package:farm_control/app/presenter/create/widgets/create_header_widget.dart';
import 'package:farm_control/config/container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAnimalPage extends StatefulWidget {
  const CreateAnimalPage({super.key});

  @override
  State<CreateAnimalPage> createState() => _CreateAnimalPageState();
}

class _CreateAnimalPageState extends State<CreateAnimalPage> {
  late final TextEditingController _createController;
  late final FocusNode _createControllerNode;
  late final GlobalKey<FormState> _formKey;
  late final ListNotifierController _listNotifier;
  late final CreateAnimalBloc _bloc;

  @override
  void initState() {
    _createController = TextEditingController();
    _createControllerNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    _listNotifier = ListNotifierController(<Map<String, dynamic>>[]);
    _bloc = appContainer.get<CreateAnimalBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FarmEntity farm =
        ModalRoute.of(context)?.settings.arguments as FarmEntity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocListener<CreateAnimalBloc, CreateAnimalState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is CreateAnimalError) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 184, 149, 147),
                  title: const Text(
                    'Erro ao cadastrar',
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                      'Aconteceu um erro inesperado e não foi possivel salvar'),
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
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _listNotifier.clear();
                        },
                        child: const Text(
                          'Fechar e limpar a lista',
                          style: TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              );
            }
            if (state is CreateAnimalSuccess) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 184, 214, 185),
                  title: const Text(
                    'Cadastro realizado',
                    textAlign: TextAlign.center,
                  ),
                  content: const Text('Animais cadastrados com sucesso!'),
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
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _listNotifier.clear();
                        },
                        child: const Text(
                          'Fechar e limpar a lista',
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
          child: BlocBuilder<CreateAnimalBloc, CreateAnimalState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is CreateAnimalLoading) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                );
              }

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    child: CreateHeaderWidget(
                        createController: _createController,
                        createControllerNode: _createControllerNode,
                        listNotifier: _listNotifier,
                        formKey: _formKey,
                        farm: farm),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _listNotifier.valueNotifierList,
                    builder: (context, value, child) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return CreateCardWidget(
                              map: value[index],
                              controller: _listNotifier,
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                if (_listNotifier.valueNotifierList.value.isNotEmpty) {
                  _bloc.add(CreateAnimalEvent(
                      mapList: _listNotifier.valueNotifierList.value));
                }
              },
              child: const Text('Salvar'))),
    );
  }
}
