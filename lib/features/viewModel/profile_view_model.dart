import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
import 'package:zero_hunger/features/services/firebase_storage_service.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
part 'profile_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase
    with Store, FirebaseStoreManagerMixin, FirebaseAuthManagerMixin, FirebaseStorageManagerMixin {
  @observable
  bool isLoading = false;

  @observable
  String username = "";

  @observable
  String photoUrl = "https://picsum.photos/200";

  @observable
  File? image;

  ImagePicker picker = ImagePicker();

  @action
  Future<void> chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
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
      image = File(response.file!.path);
    } else {
      debugPrint(response.file.toString());
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getUsernameFromFirebase() async {
    changeLoading();
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      final user = user_model.User.fromJson(await getUserFirestore(currentUser.uid));
      username = user.name ?? "";
    }
    changeLoading();
  }

  @action
  void getUsernameFromStorage(String name) {
    username = name;
  }

  @action
  Future<void> getAvatar() async {
    changeLoading();
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      final user = user_model.User.fromJson(await getUserFirestore(currentUser.uid));
      photoUrl = user.photoUrl ?? "https://picsum.photos/200";
    }
    changeLoading();
  }

  Future<user_model.User> getUser() async {
    changeLoading();
    final currentUser = getCurrentUser();
    late user_model.User user;
    if (currentUser != null) {
      user = user_model.User.fromJson(await getUserFirestore(currentUser.uid));
    }
    changeLoading();
    return user;
  }

  Future<void> uploadAvatarToirebase(File image) async {
    final currentUser = getCurrentUser();
    final user = user_model.User();
    if (currentUser != null) {
      user.id = currentUser.uid;
      user.photoUrl = await uploadAvatarFile(image);
    }
    uploadAvatar(user);
  }
}
