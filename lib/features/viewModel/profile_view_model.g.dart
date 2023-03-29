// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewModel on _UserViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_UserViewModelBase.isLoading', context: context);

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

  late final _$photoUrlAtom =
      Atom(name: '_UserViewModelBase.photoUrl', context: context);

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

  late final _$imageAtom =
      Atom(name: '_UserViewModelBase.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$chooseImageAsyncAction =
      AsyncAction('_UserViewModelBase.chooseImage', context: context);

  @override
  Future<void> chooseImage() {
    return _$chooseImageAsyncAction.run(() => super.chooseImage());
  }

  late final _$retrieveLostDataAsyncAction =
      AsyncAction('_UserViewModelBase.retrieveLostData', context: context);

  @override
  Future<void> retrieveLostData() {
    return _$retrieveLostDataAsyncAction.run(() => super.retrieveLostData());
  }

  late final _$getUsernameAsyncAction =
      AsyncAction('_UserViewModelBase.getUsername', context: context);

  @override
  Future<void> getUsername() {
    return _$getUsernameAsyncAction.run(() => super.getUsername());
  }

  late final _$getAvatarAsyncAction =
      AsyncAction('_UserViewModelBase.getAvatar', context: context);

  @override
  Future<void> getAvatar() {
    return _$getAvatarAsyncAction.run(() => super.getAvatar());
  }

  late final _$_UserViewModelBaseActionController =
      ActionController(name: '_UserViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
username: ${username},
photoUrl: ${photoUrl},
image: ${image}
    ''';
  }
}
