// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_and_signup_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginAndSignUpViewModel on _LoginAndSignUpViewModelBase, Store {
  late final _$isSecureAtom =
      Atom(name: '_LoginAndSignUpViewModelBase.isSecure', context: context);

  @override
  bool get isSecure {
    _$isSecureAtom.reportRead();
    return super.isSecure;
  }

  @override
  set isSecure(bool value) {
    _$isSecureAtom.reportWrite(value, super.isSecure, () {
      super.isSecure = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginAndSignUpViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoginAtom =
      Atom(name: '_LoginAndSignUpViewModelBase.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$suffixColorAtom =
      Atom(name: '_LoginAndSignUpViewModelBase.suffixColor', context: context);

  @override
  Color get suffixColor {
    _$suffixColorAtom.reportRead();
    return super.suffixColor;
  }

  @override
  set suffixColor(Color value) {
    _$suffixColorAtom.reportWrite(value, super.suffixColor, () {
      super.suffixColor = value;
    });
  }

  late final _$_LoginAndSignUpViewModelBaseActionController =
      ActionController(name: '_LoginAndSignUpViewModelBase', context: context);

  @override
  void changeColorOfSuffix(String value) {
    final _$actionInfo = _$_LoginAndSignUpViewModelBaseActionController
        .startAction(name: '_LoginAndSignUpViewModelBase.changeColorOfSuffix');
    try {
      return super.changeColorOfSuffix(value);
    } finally {
      _$_LoginAndSignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSecureIcon() {
    final _$actionInfo = _$_LoginAndSignUpViewModelBaseActionController
        .startAction(name: '_LoginAndSignUpViewModelBase.changeSecureIcon');
    try {
      return super.changeSecureIcon();
    } finally {
      _$_LoginAndSignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_LoginAndSignUpViewModelBaseActionController
        .startAction(name: '_LoginAndSignUpViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_LoginAndSignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLogin() {
    final _$actionInfo = _$_LoginAndSignUpViewModelBaseActionController
        .startAction(name: '_LoginAndSignUpViewModelBase.changeLogin');
    try {
      return super.changeLogin();
    } finally {
      _$_LoginAndSignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSecure: ${isSecure},
isLoading: ${isLoading},
isLogin: ${isLogin},
suffixColor: ${suffixColor}
    ''';
  }
}
