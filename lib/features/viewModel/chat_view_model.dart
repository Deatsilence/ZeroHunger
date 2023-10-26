import 'package:cloud_firestore/cloud_firestore.dart';
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

  @observable
  String text = "";

  @action
  void setText(String? value) {
    value != null ? text = value : text = "";
  }

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

  // Chat
  Future<String> createNewChatWithUserOfAdvert(String userId1, String userId2) async {
    changeLoading();
    var chatId = await createChat(userId1, userId2);
    changeLoading();
    return chatId;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsOfCurrentUser(String userId) {
    changeLoading();
    final chats = getChats(userId);
    List<user_model.User> users = [];
    chats.listen(
      (event) {
        for (var item in event.docs) {
          final user = compute(user_model.User.fromJson, item.data());
          users.add(user as user_model.User);
        }
      },
    );
    changeLoading();

    return chats;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesOfAdvertOwner(String chatId) {
    changeLoading();
    final messages = getMessages(chatId);
    changeLoading();

    return messages;
  }

  Future<void> sendAmessageToAdvertOwner(String chatId, String user1Id, String user2Id, String text) async {
    changeLoading();
    await sendMessage(chatId, user1Id, user2Id, text);
    changeLoading();
  }
}
