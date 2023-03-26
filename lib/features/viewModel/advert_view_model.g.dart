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

  late final _$itemsAtom =
      Atom(name: '_AdvertViewModelBase.items', context: context);

  @override
  List<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AdvertViewModelBase.isLoading', context: context);

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

  late final _$imagesAtom =
      Atom(name: '_AdvertViewModelBase.images', context: context);

  @override
  ObservableList<File> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<File> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_AdvertViewModelBase.picker', context: context);

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  late final _$chooseImageAsyncAction =
      AsyncAction('_AdvertViewModelBase.chooseImage', context: context);

  @override
  Future<void> chooseImage() {
    return _$chooseImageAsyncAction.run(() => super.chooseImage());
  }

  late final _$retrieveLostDataAsyncAction =
      AsyncAction('_AdvertViewModelBase.retrieveLostData', context: context);

  @override
  Future<void> retrieveLostData() {
    return _$retrieveLostDataAsyncAction.run(() => super.retrieveLostData());
  }

  late final _$_AdvertViewModelBaseActionController =
      ActionController(name: '_AdvertViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_AdvertViewModelBaseActionController.startAction(
        name: '_AdvertViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_AdvertViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
isStrechedDropwDown: ${isStrechedDropwDown},
items: ${items},
isLoading: ${isLoading},
images: ${images},
picker: ${picker}
    ''';
  }
}
