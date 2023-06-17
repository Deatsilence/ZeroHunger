// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardViewModel on _DashboardViewModelBase, Store {
  late final _$isScrollVisibleAtom =
      Atom(name: '_DashboardViewModelBase.isScrollVisible', context: context);

  @override
  bool get isScrollVisible {
    _$isScrollVisibleAtom.reportRead();
    return super.isScrollVisible;
  }

  @override
  set isScrollVisible(bool value) {
    _$isScrollVisibleAtom.reportWrite(value, super.isScrollVisible, () {
      super.isScrollVisible = value;
    });
  }

  late final _$titleOfAdvertAtom =
      Atom(name: '_DashboardViewModelBase.titleOfAdvert', context: context);

  @override
  String get titleOfAdvert {
    _$titleOfAdvertAtom.reportRead();
    return super.titleOfAdvert;
  }

  @override
  set titleOfAdvert(String value) {
    _$titleOfAdvertAtom.reportWrite(value, super.titleOfAdvert, () {
      super.titleOfAdvert = value;
    });
  }

  late final _$_DashboardViewModelBaseActionController =
      ActionController(name: '_DashboardViewModelBase', context: context);

  @override
  void searchTitle(String value) {
    final _$actionInfo = _$_DashboardViewModelBaseActionController.startAction(
        name: '_DashboardViewModelBase.searchTitle');
    try {
      return super.searchTitle(value);
    } finally {
      _$_DashboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isScrollVisible: ${isScrollVisible},
titleOfAdvert: ${titleOfAdvert}
    ''';
  }
}
