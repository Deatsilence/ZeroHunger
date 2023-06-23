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

  late final _$_ChatViewModelBaseActionController =
      ActionController(name: '_ChatViewModelBase', context: context);

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
isLoading: ${isLoading}
    ''';
  }
}
