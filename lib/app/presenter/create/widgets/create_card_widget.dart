import 'package:farm_control/app/presenter/create/controller/list_notifier_controller.dart';
import 'package:flutter/material.dart';

class CreateCardWidget extends StatelessWidget {
  final Map<String, dynamic> map;
  final ListNotifierController controller;
  const CreateCardWidget(
      {super.key, required this.map, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.grey])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'TAG: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: map['animal_tag'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'FARM ID: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: map['farm_id'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ])),
            ],
          ),
          IconButton(
            onPressed: () =>
                controller.removeElement(animalTag: map['animal_tag']),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
