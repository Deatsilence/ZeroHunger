// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdvertViewModel on _AdvertViewModelBase, Store {
  late final _$isStrechedDropwDownAtom =
      Atom(name: '_AdvertViewModelBase.isStrechedDropwDown', context: context);

  @override
  bool get isStrechedDropwDown {
    _$isStrechedDropwDownAtom.reportRead();
    return super.isStrechedDropwDown;
  }

  @override
  set isStrechedDropwDown(bool value) {
    _$isStrechedDropwDownAtom.reportWrite(value, super.isStrechedDropwDown, () {
      super.isStrechedDropwDown = value;
    });
  }

  late final _$_AdvertViewModelBaseActionController =
      ActionController(name: '_AdvertViewModelBase', context: context);

  @override
  void changeIsStrechedDropwDown() {
    final _$actionInfo = _$_AdvertViewModelBaseActionController.startAction(
        name: '_AdvertViewModelBase.changeIsStrechedDropwDown');
    try {
      return super.changeIsStrechedDropwDown();
    } finally {
      _$_AdvertViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isStrechedDropwDown: ${isStrechedDropwDown}
    ''';
  }
}
