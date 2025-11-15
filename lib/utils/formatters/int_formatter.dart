class IntFormatter {
  static String toShow(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }
}
