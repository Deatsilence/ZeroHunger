mixin ValidatorMixin {
  bool isValidUsername(String username) {
    String rule = r"^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$";

    return RegExp(rule).hasMatch(username);
  }

  bool isValidPasswordLength(String password) => password.length >= 6;

  bool isValidEmail(String email) {
    String rule =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

    return RegExp(rule).hasMatch(email);
  }
}
