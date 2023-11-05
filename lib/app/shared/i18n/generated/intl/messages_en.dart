// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "amountAnimals": MessageLookupByLibrary.simpleMessage(
            "Animals linked to the farm: "),
        "animalExcludeSuccess": MessageLookupByLibrary.simpleMessage(
            "Animal excluded successfully!"),
        "animalManagment":
            MessageLookupByLibrary.simpleMessage("Manage animal"),
        "anyFarmFinded":
            MessageLookupByLibrary.simpleMessage("No farm linked to its user"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeTag": MessageLookupByLibrary.simpleMessage("Change tag"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "closeAndClean":
            MessageLookupByLibrary.simpleMessage("Close and clean the list"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Do you really want to delete?"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteTag": MessageLookupByLibrary.simpleMessage("Delete tag"),
        "errorToExclude":
            MessageLookupByLibrary.simpleMessage("Error when excluding"),
        "errorToExcludeTryAgain": MessageLookupByLibrary.simpleMessage(
            "Error excluding animal, try again!"),
        "errorToLoad":
            MessageLookupByLibrary.simpleMessage("Error when loading"),
        "errorToLoadingFarms": MessageLookupByLibrary.simpleMessage(
            "Error when carrying farms, try again"),
        "errorToUpdate":
            MessageLookupByLibrary.simpleMessage("Erro ao atualizar"),
        "errorToUpdateTryAgain": MessageLookupByLibrary.simpleMessage(
            "Error update animal, try again!"),
        "excludeDone":
            MessageLookupByLibrary.simpleMessage("Exclusion accomplished"),
        "farm": MessageLookupByLibrary.simpleMessage("FARM: "),
        "farmId": MessageLookupByLibrary.simpleMessage("FARM ID: "),
        "insert": MessageLookupByLibrary.simpleMessage("Insert"),
        "newTag": MessageLookupByLibrary.simpleMessage("New Tag"),
        "noAnimalsFinded":
            MessageLookupByLibrary.simpleMessage("No animals found"),
        "putHereAnimalTag":
            MessageLookupByLibrary.simpleMessage("Put the animal tag here"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerAnimal":
            MessageLookupByLibrary.simpleMessage("Register animal"),
        "registerDone": MessageLookupByLibrary.simpleMessage("Registration"),
        "registerDoneSuccess":
            MessageLookupByLibrary.simpleMessage("Successful animals!"),
        "registerError":
            MessageLookupByLibrary.simpleMessage("Error when registering"),
        "registerErrorTryAgain": MessageLookupByLibrary.simpleMessage(
            "An unexpected mistake happened and it was not possible to save"),
        "registerFarmToStart":
            MessageLookupByLibrary.simpleMessage("Register a farm to start"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("To look for"),
        "searchAnimal": MessageLookupByLibrary.simpleMessage("Search Animal"),
        "searchError": MessageLookupByLibrary.simpleMessage(
            "Error when searching, try again"),
        "searchForTagOrId":
            MessageLookupByLibrary.simpleMessage("Search by Tag or Animal ID"),
        "selectAFarm":
            MessageLookupByLibrary.simpleMessage("Select a farm to start"),
        "tag": MessageLookupByLibrary.simpleMessage("Current tag: "),
        "tagCantBeRegisteredAgain": MessageLookupByLibrary.simpleMessage(
            "Tag is already registered in the current list"),
        "tagValidatorErrorMsg": MessageLookupByLibrary.simpleMessage(
            "The tag needs to have 15 characters and they all need to be numbers"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "updateDone": MessageLookupByLibrary.simpleMessage("UPDATED"),
        "updateDoneIfSuccess": MessageLookupByLibrary.simpleMessage(
            "Update successfully performed!")
      };
}
