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

  late final _$_LoginAndSignUpViewModelBaseActionController =
      ActionController(name: '_LoginAndSignUpViewModelBase', context: context);

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
  String toString() {
    return '''
isSecure: ${isSecure}
    ''';
  }
}
