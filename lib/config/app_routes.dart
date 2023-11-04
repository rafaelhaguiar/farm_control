import 'package:farm_control/app/presenter/farm/farm_page.dart';
import 'package:flutter/material.dart';

enum RouteUrl {
  splash(url: '/'),
  home(url: '/home');

  const RouteUrl({required this.url});
  final String url;
}

class AppRoutes {
  static final allRoutes = {
    RouteUrl.splash.url: (BuildContext context) => const FarmPage(),
  };
}
