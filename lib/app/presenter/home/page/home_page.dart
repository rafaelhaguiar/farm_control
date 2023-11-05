import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/home/widgets/home_card_widget.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final farm = ModalRoute.of(context)?.settings.arguments as FarmEntity;

    return Scaffold(
      appBar: AppBar(
        title: Text(farm.farmName),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          HomeCardWidget(
              title: 'Pesquisar Animal',
              icon: Icons.search,
              function: () => Navigator.pushNamed(context, RouteUrl.search.url,
                  arguments: farm)),
          HomeCardWidget(
              title: 'Cadastrar Animal',
              icon: Icons.add,
              function: () => Navigator.pushNamed(context, RouteUrl.create.url,
                  arguments: farm)),
        ],
      ),
    );
  }
}
