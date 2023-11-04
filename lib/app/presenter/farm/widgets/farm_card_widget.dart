import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:flutter/material.dart';

class FarmCardWidget extends StatelessWidget {
  const FarmCardWidget({
    super.key,
    required this.item,
  });

  final FarmEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 25, left: 25, top: 15),
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 171, 169, 169),
            Color.fromARGB(255, 255, 226, 226)
          ]),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                    const TextSpan(
                        text: 'Fazenda: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: item.farmName),
                  ])),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                    const TextSpan(
                        text: 'ID: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: item.farmId.toString()),
                  ])),
            ],
          ),
          IconButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, RouteUrl.home.url,
                  arguments: item),
              icon: const Icon(Icons.navigate_next))
        ],
      ),
    );
  }
}
