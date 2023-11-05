import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/create/controller/list_notifier_controller.dart';
import 'package:farm_control/app/shared/i18n/generated/l10n.dart';
import 'package:farm_control/app/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class CreateHeaderWidget extends StatelessWidget {
  const CreateHeaderWidget({
    super.key,
    required TextEditingController createController,
    required FocusNode createControllerNode,
    required ListNotifierController listNotifier,
    required GlobalKey<FormState> formKey,
    required this.farm,
  })  : _createController = createController,
        _createControllerNode = createControllerNode,
        _listNotifier = listNotifier,
        _formKey = formKey;

  final TextEditingController _createController;
  final FocusNode _createControllerNode;
  final ListNotifierController _listNotifier;
  final GlobalKey<FormState> _formKey;
  final FarmEntity farm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _createController,
            focusNode: _createControllerNode,
            validator: (value) {
              _createControllerNode.unfocus();
              if (!(value ?? "").animalTagIsValid()) {
                return S.of(context).tagValidatorErrorMsg;
              }
              final verifyIfExists = _listNotifier.valueNotifierList.value
                  .where((element) => element['animal_tag'] == value);
              if (verifyIfExists.isNotEmpty) {
                return S.of(context).tagCantBeRegisteredAgain;
              }
              return null;
            },
            decoration:
                InputDecoration(hintText: S.of(context).putHereAnimalTag),
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
            child: Text(S.of(context).insert))
      ],
    );
  }
}
