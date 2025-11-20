class EmptyValidator {
  static String? validate(String? value) {
    if (value == null) {
      return 'Preencha o campo corretamente.';
    }
    if (value.trim().isEmpty) {
      return 'Preencha o campo corretamente.';
    }
    return null;
  }
}
