import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/home/bloc/home_bloc.dart';
import 'package:farm_control/app/presenter/home/widgets/home_card_widget.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    final farm = ModalRoute.of(context)?.settings.arguments as FarmEntity;
    bloc = BlocProvider.of<HomeBloc>(context);

    bloc.add(HomeEvent(farm.farmId));

    return Scaffold(
      appBar: AppBar(
        title: Text(farm.farmName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Animais vinculados a fazenda: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return Text(
                      state.amount.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 28),
                    );
                  }
                  if (state is HomeLoading || state is HomeInitial) {
                    return const CircularProgressIndicator();
                  }
                  if (state is HomeError) {
                    return const Text(
                      'Erro ao carregar',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.red),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                HomeCardWidget(
                    title: 'Pesquisar Animal',
                    icon: Icons.search,
                    function: () => Navigator.pushNamed(
                        context, RouteUrl.search.url,
                        arguments: farm)),
                HomeCardWidget(
                    title: 'Cadastrar Animal',
                    icon: Icons.add,
                    function: () => Navigator.pushNamed(
                        context, RouteUrl.create.url,
                        arguments: farm)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
