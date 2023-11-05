import 'package:flutter/material.dart';

class ListNotifierController extends ValueNotifier {
  ListNotifierController(super.value) {
    valueNotifierList = ValueNotifier<List<Map<String, dynamic>>>(super.value);
  }

  late final ValueNotifier<List<Map<String, dynamic>>> valueNotifierList;

  void addValue({required Map<String, dynamic> map}) {
    valueNotifierList.value.add(map);
    valueNotifierList.notifyListeners();
  }

  void clear() {
    valueNotifierList.value.clear();
    valueNotifierList.notifyListeners();
  }

  void removeElement({required String animalTag}) {
    valueNotifierList.value
        .removeWhere((element) => element['animal_tag'] == animalTag);
    valueNotifierList.notifyListeners();
  }
}
