import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/search/bloc/search_animal_bloc.dart';
import 'package:farm_control/app/presenter/search/widgets/search_card_widget.dart';
import 'package:farm_control/app/shared/i18n/generated/l10n.dart';
import 'package:farm_control/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAnimalPage extends StatefulWidget {
  const SearchAnimalPage({super.key});

  @override
  State<SearchAnimalPage> createState() => _SearchAnimalPageState();
}

class _SearchAnimalPageState extends State<SearchAnimalPage> {
  final _searchController = TextEditingController();
  final _searchControllerNode = FocusNode();
  late final SearchAnimalBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SearchAnimalBloc>(context);

    final farm = ModalRoute.of(context)?.settings.arguments as FarmEntity;
    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).searchAnimal),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.popUntil(
                    context, ModalRoute.withName(RouteUrl.home.url)),
                icon: const Icon(Icons.home))
          ]),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(7),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    focusNode: _searchControllerNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: S.of(context).searchForTagOrId),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _searchControllerNode.unfocus();
                      bloc.add(SearchAnimalEvent(
                          args: _searchController.text, farmId: farm.farmId));
                    },
                    child: Text(S.of(context).search))
              ],
            ),
          ),
          BlocBuilder<SearchAnimalBloc, SearchAnimalState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is SearchAnimalLoading) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                if (state is SearchAnimalSuccess) {
                  if (state.animalList.isEmpty) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(S.of(context).noAnimalsFinded)]);
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.animalList.length,
                        itemBuilder: (context, index) {
                          final animal = state.animalList[index];
                          return SearchCardWidget(
                            farmEntity: farm,
                            animalEntity: animal,
                          );
                        }),
                  );
                }
                if (state is SearchAnimalError) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(S.of(context).searchError)]);
                }
                return Container();
              })
        ],
      ),
    );
  }
}
