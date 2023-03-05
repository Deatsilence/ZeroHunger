mixin ValidatorMixin {
  bool isValidPasswordLength(String password) => password.length >= 6;

  bool isValidEmail(String email) {
    String rule =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

    return RegExp(rule).hasMatch(email);
  }
}
