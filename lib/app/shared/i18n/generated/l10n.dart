// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Register a farm to start`
  String get registerFarmToStart {
    return Intl.message(
      'Register a farm to start',
      name: 'registerFarmToStart',
      desc: '',
      args: [],
    );
  }

  /// `Select a farm to start`
  String get selectAFarm {
    return Intl.message(
      'Select a farm to start',
      name: 'selectAFarm',
      desc: '',
      args: [],
    );
  }

  /// `No farm linked to its user`
  String get anyFarmFinded {
    return Intl.message(
      'No farm linked to its user',
      name: 'anyFarmFinded',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Error when carrying farms, try again`
  String get errorToLoadingFarms {
    return Intl.message(
      'Error when carrying farms, try again',
      name: 'errorToLoadingFarms',
      desc: '',
      args: [],
    );
  }

  /// `Exclusion accomplished`
  String get excludeDone {
    return Intl.message(
      'Exclusion accomplished',
      name: 'excludeDone',
      desc: '',
      args: [],
    );
  }

  /// `Manage animal`
  String get animalManagment {
    return Intl.message(
      'Manage animal',
      name: 'animalManagment',
      desc: '',
      args: [],
    );
  }

  /// `Animal excluded successfully!`
  String get animalExcludeSuccess {
    return Intl.message(
      'Animal excluded successfully!',
      name: 'animalExcludeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error when excluding`
  String get errorToExclude {
    return Intl.message(
      'Error when excluding',
      name: 'errorToExclude',
      desc: '',
      args: [],
    );
  }

  /// `Error excluding animal, try again!`
  String get errorToExcludeTryAgain {
    return Intl.message(
      'Error excluding animal, try again!',
      name: 'errorToExcludeTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `UPDATED`
  String get updateDone {
    return Intl.message(
      'UPDATED',
      name: 'updateDone',
      desc: '',
      args: [],
    );
  }

  /// `Update successfully performed!`
  String get updateDoneIfSuccess {
    return Intl.message(
      'Update successfully performed!',
      name: 'updateDoneIfSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao atualizar`
  String get errorToUpdate {
    return Intl.message(
      'Erro ao atualizar',
      name: 'errorToUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Error update animal, try again!`
  String get errorToUpdateTryAgain {
    return Intl.message(
      'Error update animal, try again!',
      name: 'errorToUpdateTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `FARM ID: `
  String get farmId {
    return Intl.message(
      'FARM ID: ',
      name: 'farmId',
      desc: '',
      args: [],
    );
  }

  /// `FARM: `
  String get farm {
    return Intl.message(
      'FARM: ',
      name: 'farm',
      desc: '',
      args: [],
    );
  }

  /// `Change tag`
  String get changeTag {
    return Intl.message(
      'Change tag',
      name: 'changeTag',
      desc: '',
      args: [],
    );
  }

  /// `Current tag: `
  String get tag {
    return Intl.message(
      'Current tag: ',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `The tag needs to have 15 characters and they all need to be numbers`
  String get tagValidatorErrorMsg {
    return Intl.message(
      'The tag needs to have 15 characters and they all need to be numbers',
      name: 'tagValidatorErrorMsg',
      desc: '',
      args: [],
    );
  }

  /// `New Tag`
  String get newTag {
    return Intl.message(
      'New Tag',
      name: 'newTag',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete tag`
  String get deleteTag {
    return Intl.message(
      'Delete tag',
      name: 'deleteTag',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete?`
  String get confirmDelete {
    return Intl.message(
      'Do you really want to delete?',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Error when registering`
  String get registerError {
    return Intl.message(
      'Error when registering',
      name: 'registerError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected mistake happened and it was not possible to save`
  String get registerErrorTryAgain {
    return Intl.message(
      'An unexpected mistake happened and it was not possible to save',
      name: 'registerErrorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Close and clean the list`
  String get closeAndClean {
    return Intl.message(
      'Close and clean the list',
      name: 'closeAndClean',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registerDone {
    return Intl.message(
      'Registration',
      name: 'registerDone',
      desc: '',
      args: [],
    );
  }

  /// `Successful animals!`
  String get registerDoneSuccess {
    return Intl.message(
      'Successful animals!',
      name: 'registerDoneSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tag is already registered in the current list`
  String get tagCantBeRegisteredAgain {
    return Intl.message(
      'Tag is already registered in the current list',
      name: 'tagCantBeRegisteredAgain',
      desc: '',
      args: [],
    );
  }

  /// `Put the animal tag here`
  String get putHereAnimalTag {
    return Intl.message(
      'Put the animal tag here',
      name: 'putHereAnimalTag',
      desc: '',
      args: [],
    );
  }

  /// `Insert`
  String get insert {
    return Intl.message(
      'Insert',
      name: 'insert',
      desc: '',
      args: [],
    );
  }

  /// `Animals linked to the farm: `
  String get amountAnimals {
    return Intl.message(
      'Animals linked to the farm: ',
      name: 'amountAnimals',
      desc: '',
      args: [],
    );
  }

  /// `Error when loading`
  String get errorToLoad {
    return Intl.message(
      'Error when loading',
      name: 'errorToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Search Animal`
  String get searchAnimal {
    return Intl.message(
      'Search Animal',
      name: 'searchAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Register animal`
  String get registerAnimal {
    return Intl.message(
      'Register animal',
      name: 'registerAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Search by Tag or Animal ID`
  String get searchForTagOrId {
    return Intl.message(
      'Search by Tag or Animal ID',
      name: 'searchForTagOrId',
      desc: '',
      args: [],
    );
  }

  /// `To look for`
  String get search {
    return Intl.message(
      'To look for',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No animals found`
  String get noAnimalsFinded {
    return Intl.message(
      'No animals found',
      name: 'noAnimalsFinded',
      desc: '',
      args: [],
    );
  }

  /// `Error when searching, try again`
  String get searchError {
    return Intl.message(
      'Error when searching, try again',
      name: 'searchError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
