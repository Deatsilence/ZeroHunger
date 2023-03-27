import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/constant/enums/name_of_categories_enum.dart';
import 'package:zero_hunger/features/extensions/string_extensions.dart';
import 'package:zero_hunger/features/model/item_model.dart';
import 'package:zero_hunger/features/services/firebase_storage_service.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
part 'advert_view_model.g.dart';

class AdvertViewModel = _AdvertViewModelBase with _$AdvertViewModel;

abstract class _AdvertViewModelBase
    with Store, FirebaseAuthManagerMixin, FirebaseStorageManagerMixin, FirebaseStoreManagerMixin {
  String? value;

  @observable
  bool isStrechedDropwDown = false;

  @observable
  List<String> items = [
    Categories.food.name.capitalize(),
    Categories.drink.name.capitalize(),
    Categories.sweet.name.capitalize(),
    Categories.snack.name.capitalize(),
  ];

  @observable
  bool isLoading = false;

  @observable
  ObservableList<File> images = ObservableList<File>();

  @observable
  ImagePicker picker = ImagePicker();

  @action
  Future<void> chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add(File(pickedFile.path));
    } else {
      retrieveLostData();
    }
  }

  @action
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      images.add(File(response.file!.path));
    } else {
      print(response.file);
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void changeIsStrechedDropwDown() {
    isStrechedDropwDown = !isStrechedDropwDown;
  }

  // Future<Query<Map<String, dynamic>>> streamOfItems() async {
  //   final currentUser = instance.currentUser;
  //   if (currentUser is user.User && currentUser != null) {
  //     final myItems = await getMyItems(currentUser);

  //     return myItems;
  //   }
  // }

  void setValue(String newValue) {
    value = newValue;
  }

  Future<void> uploadAdvertToirebase(Item item, ObservableList<File> images) async {
    final currentUser = getCurrentUser();

    if (currentUser != null) {
      item.userId = currentUser.uid;
      item.photoUrls = await uploadFile(images);
    }
    uploadAdvert(item);
  }
}