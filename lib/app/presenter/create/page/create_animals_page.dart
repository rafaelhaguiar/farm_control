import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/create/controller/list_notifier_controller.dart';
import 'package:farm_control/app/presenter/create/widgets/create_card_widget.dart';
import 'package:farm_control/app/shared/utils/extensions.dart';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    _createController = TextEditingController();
    _createControllerNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    _listNotifier = ListNotifierController(<Map<String, dynamic>>[]);
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(7),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _createController,
                      focusNode: _createControllerNode,
                      validator: (value) {
                        _createControllerNode.unfocus();
                        if (!(value ?? "").animalTagIsValid()) {
                          return 'A tag precisa ter 15 caracteres e todos eles precisam ser números';
                        }
                        final verifyIfExists = _listNotifier
                            .valueNotifierList.value
                            .where((element) => element['animal_tag'] == value);
                        if (verifyIfExists.isNotEmpty) {
                          return 'A tag já esta cadastrada na lista atual';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Coloque aqui a TAG do animal'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _listNotifier.addValue(map: {
                            'animal_tag': _createController.text,
                            'farm_id': farm.farmId
                          });
                        }
                      },
                      child: const Text('Inserir'))
                ],
              ),
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
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(onPressed: () {}, child: const Text('Salvar'))),
    );
  }
}
