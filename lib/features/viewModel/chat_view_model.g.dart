// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatViewModel on _ChatViewModelBase, Store {
  late final _$usersAtom =
      Atom(name: '_ChatViewModelBase.users', context: context);

  @override
  ObservableList<user_model.User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<user_model.User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChatViewModelBase.isLoading', context: context);

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

  late final _$usernameAtom =
      Atom(name: '_ChatViewModelBase.username', context: context);

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

  late final _$photoUrlAtom =
      Atom(name: '_ChatViewModelBase.photoUrl', context: context);

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  late final _$textAtom =
      Atom(name: '_ChatViewModelBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$_ChatViewModelBaseActionController =
      ActionController(name: '_ChatViewModelBase', context: context);

  @override
  void setText(String? value) {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
        name: '_ChatViewModelBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
        name: '_ChatViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
isLoading: ${isLoading},
username: ${username},
photoUrl: ${photoUrl},
text: ${text}
    ''';
  }
}
