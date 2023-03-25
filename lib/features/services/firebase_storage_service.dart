import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:path/path.dart' as path;

mixin FirebaseStorageManagerMixin {
  firebase_storage.Reference get _firebaseStorage => firebase_storage.FirebaseStorage.instance.ref();

  AdvertViewModel get _avm => AdvertViewModel();

  Future<List<String>> uploadFile(ObservableList<File> images) async {
    List<String> pathOfImages = [];
    for (var img in images) {
      var ref = _firebaseStorage.child("images/${path.basename(img.path)}");

      await ref.putFile(img).whenComplete(
            () async => await ref.getDownloadURL().then(
                  (value) => pathOfImages.add(value),
                ),
          );
    }
    return pathOfImages;
  }
}
