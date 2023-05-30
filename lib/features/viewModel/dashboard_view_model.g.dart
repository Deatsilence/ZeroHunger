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

  @override
  String toString() {
    return '''
isScrollVisible: ${isScrollVisible}
    ''';
  }
}
