// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewModel on _UserViewModelBase, Store {
  late final _$usernameAtom =
      Atom(name: '_UserViewModelBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$getUsernameAsyncAction =
      AsyncAction('_UserViewModelBase.getUsername', context: context);

  @override
  Future<void> getUsername() {
    return _$getUsernameAsyncAction.run(() => super.getUsername());
  }

  @override
  String toString() {
    return '''
username: ${username}
    ''';
  }
}
