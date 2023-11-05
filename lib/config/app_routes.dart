import 'package:farm_control/app/presenter/animal/page/animal_page.dart';
import 'package:farm_control/app/presenter/create/page/create_animals_page.dart';
import 'package:farm_control/app/presenter/search/page/search_animal_page.dart';
import 'package:farm_control/app/presenter/farm/page/farm_page.dart';
import 'package:farm_control/app/presenter/home/page/home_page.dart';
import 'package:flutter/material.dart';

enum RouteUrl {
  splash(url: '/'),
  home(url: '/home'),
  create(url: '/create'),

  search(url: '/search'),
  animal(url: '/animal');

  const RouteUrl({required this.url});
  final String url;
}

class AppRoutes {
  static final allRoutes = {
    RouteUrl.splash.url: (BuildContext context) => const FarmPage(),
    RouteUrl.home.url: (BuildContext context) => const HomePage(),
    RouteUrl.create.url: (BuildContext context) => const CreateAnimalPage(),
    RouteUrl.search.url: (BuildContext context) => const SearchAnimalPage(),
    RouteUrl.animal.url: (BuildContext context) => const AnimalPage(),
  };
}
