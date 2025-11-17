extension FirstUppercase on String {
  String firstLetterUppercase() {
    return replaceFirst(this[0], this[0].toUpperCase());
  }
}
