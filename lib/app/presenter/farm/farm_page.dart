import 'package:farm_control/app/domain/farms/entity/farm_entity.dart';
import 'package:farm_control/app/presenter/farm/bloc/farm_bloc.dart';
import 'package:farm_control/app/presenter/farm/widgets/farm_card_widget.dart';
import 'package:farm_control/app/presenter/farm/widgets/farm_header_widget.dart';
import 'package:farm_control/app/shared/i18n/generated/l10n.dart';
import 'package:farm_control/config/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  late final FarmBloc bloc;

  @override
  void initState() {
    bloc = appContainer.get<FarmBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const FarmHeaderWidget(),
            BlocBuilder<FarmBloc, FarmState>(
                bloc: bloc,
                builder: (context, state) {
                  switch (state) {
                    case FarmInitial():
                      bloc.add(GetFarmsEvent());
                      return const CircularProgressIndicator();
                    case FarmLoading():
                      return const CircularProgressIndicator();
                    case FarmError():
                      return Column(
                        children: [
                          Text(S.of(context).errorToLoadingFarms),
                          ElevatedButton(
                              onPressed: () => bloc.add(GetFarmsEvent()),
                              child: Text(S.of(context).tryAgain)),
                        ],
                      );
                    case FarmSuccess<void>(data: null):
                      return Text(S.of(context).anyFarmFinded);
                    case FarmSuccess<List<FarmEntity>>():
                      return Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Text(
                                S.of(context).selectAFarm,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                final item = state.data[index];
                                return FarmCardWidget(item: item);
                              },
                            )),
                          ],
                        ),
                      );
                    default:
                      return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
