// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdvertDetailViewModel on _AdvertDetailViewModelBase, Store {
  late final _$isloadingAtom =
      Atom(name: '_AdvertDetailViewModelBase.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_AdvertDetailViewModelBase.username', context: context);

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
      Atom(name: '_AdvertDetailViewModelBase.photoUrl', context: context);

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

  late final _$currentIndexAtom =
      Atom(name: '_AdvertDetailViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_AdvertDetailViewModelBaseActionController =
      ActionController(name: '_AdvertDetailViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_AdvertDetailViewModelBaseActionController
        .startAction(name: '_AdvertDetailViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_AdvertDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseCurrentIndex(int index) {
    final _$actionInfo = _$_AdvertDetailViewModelBaseActionController
        .startAction(name: '_AdvertDetailViewModelBase.increaseCurrentIndex');
    try {
      return super.increaseCurrentIndex(index);
    } finally {
      _$_AdvertDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
username: ${username},
photoUrl: ${photoUrl},
currentIndex: ${currentIndex}
    ''';
  }
}
