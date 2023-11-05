import 'package:farm_control/app/domain/animals/entity/animal_entity.dart';
import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:flutter/material.dart';

class SearchCardWidget extends StatelessWidget {
  final AnimalEntity animalEntity;
  final FarmEntity farmEntity;
  const SearchCardWidget(
      {super.key, required this.animalEntity, required this.farmEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.grey])),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, RouteUrl.animal.url,
            arguments: {"animal": animalEntity, "farm": farmEntity}),
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
                    text: animalEntity.animalTag,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ])),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: 'ID: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: animalEntity.animalId.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ])),
              ],
            ),
            const Icon(
              Icons.navigate_next,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
