import 'package:farm_control/app/shared/storage/sqlite_helper.dart';
import 'package:farm_control/config/app_widget.dart';
import 'package:farm_control/config/container.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap() async {
  final database = await SqliteHelper.instance;

  initAppContainer(database: database);
  runApp(const AppWidget());
}
