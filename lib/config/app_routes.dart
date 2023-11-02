import 'package:flutter/material.dart';

enum RouteUrl {
  splash(url: '/');

  const RouteUrl({required this.url});
  final String url;
}

class AppRoutes {
  static final allRoutes = {
    RouteUrl.splash.url: (BuildContext context) => Container(),
  };
}
