extension StringExtensions on String {
  //A valid animal tag needs to have 15 characters, and all characters must be numbers.
  bool animalTagIsValid() => RegExp(r'^([0-9]{15})$').hasMatch(this);
}
