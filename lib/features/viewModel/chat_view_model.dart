import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
part 'chat_view_model.g.dart';

class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store, FirebaseStoreManagerMixin {
  @observable
  ObservableList<user_model.User> users = ObservableList<user_model.User>();

  @observable
  bool isLoading = false;

  @observable
  String username = "";

  @observable
  String photoUrl = "";

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getUsernameFromFirebase(String documentPath) async {
    changeLoading();
    final user = await compute(user_model.User.fromJson, await getUserFirestoreService(documentPath));
    username = user.name ?? "";
    changeLoading();
  }

  Future<void> getAvatarOfAdvertOwnerFromFirebase(String documentPath) async {
    changeLoading();
    final user = await compute(user_model.User.fromJson, await getUserFirestoreService(documentPath));
    photoUrl = user.photoUrl ?? "";
    changeLoading();
  }

  Future<void> createNewChatWithUserOfAdvert(String userId1, String userId2) async {
    changeLoading();
    await createChat(userId1, userId2);
    changeLoading();
  }
}
