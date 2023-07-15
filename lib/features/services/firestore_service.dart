import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/features/constant/enums/firebase_collections_enum.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/model/item_model.dart';
import 'package:zero_hunger/features/model/user_model.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

mixin FirebaseStoreManagerMixin {
  FirebaseFirestore get _firestoreInstance => FirebaseFirestore.instance;

  Future<void> signUpFirestoreService(User user) async {
    final docUser = _firestoreInstance.collection(FireBaseCollections.Users.name).doc(user.id);

    final json = user.toJson();
    await docUser.set(json);
  }

  Future<Map<String, dynamic>> getUserFirestoreService(String documentPath) async {
    final docUser = _firestoreInstance.collection(FireBaseCollections.Users.name).doc(documentPath);
    final response = await docUser.get();
    return response.data() ?? <String, dynamic>{};
  }

  Future<void> uploadAdvertService(Item item) async {
    final docItem = _firestoreInstance.collection(FireBaseCollections.Items.name).doc(item.id);
    item.id = docItem.id;
    item.createdAt = DateFormat.yMMMd().format(DateTime.now());
    final json = item.toJson();
    await docItem.set(json);
  }

  Future<void> uploadAvatarService(User user) async {
    final docUser = _firestoreInstance.collection(FireBaseCollections.Users.name).doc(user.id);

    user.updatedAt = DateFormat.yMMMd().format(DateTime.now());
    await docUser.update({
      "photoUrl": user.photoUrl,
      "updatedAt": user.updatedAt,
    });
  }

  Future<void> deleteItemFromFirestoreService(String id) async {
    await _firestoreInstance.collection(FireBaseCollections.Items.name).doc(id).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyItemsService(auth.User? user) {
    final querySnapshot = _firestoreInstance
        .collection(FireBaseCollections.Items.name)
        .where(ProjectTextUtility.textUserIdOfItemStorage, isEqualTo: user?.uid)
        .snapshots();
    return querySnapshot;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllItemsService() {
    final querySnapshot = _firestoreInstance.collection(FireBaseCollections.Items.name).snapshots();
    return querySnapshot;
  }

  //[START] Chat

  Stream<QuerySnapshot<Map<String, dynamic>>> getChats(String userId) {
    return _firestoreInstance
        .collection(ProjectTextUtility.textChats)
        .where(ProjectTextUtility.textUser1Id, isEqualTo: userId)
        .orderBy(ProjectTextUtility.textLastMessageTimestamp, descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String chatId) {
    return _firestoreInstance
        .collection(ProjectTextUtility.textChats)
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> createChat(String user1Id, String user2Id) async {
    // Yeni bir sohbet dökümanı oluşturma
    DocumentReference chatRef = await _firestoreInstance.collection(ProjectTextUtility.textChats).add({
      ProjectTextUtility.textUser1Id: user1Id,
      ProjectTextUtility.textUser2Id: user2Id,
      ProjectTextUtility.textLastMessage: '',
      ProjectTextUtility.textLastMessageTimestamp: Timestamp.now(),
      ProjectTextUtility.textUnreadCountUser1: 0,
      ProjectTextUtility.textUnreadCountUser2: 0,
    });

    // Her iki kullanıcının sohbet referansını güncelleme
    String chatId = chatRef.id;
    await _firestoreInstance.collection('users').doc(user1Id).update({
      'chats': FieldValue.arrayUnion([chatId]),
    });
    await _firestoreInstance.collection('users').doc(user2Id).update({
      'chats': FieldValue.arrayUnion([chatId]),
    });
  }

  Future<void> sendMessage(String chatId, String user1Id, String user2Id, String text) async {
    await _createNewChat(chatId, user1Id, text);
    await _updateLastMessage(chatId, text);
    await _incrementUnreadCountUsers(chatId, user1Id, user2Id);
  }

  Future<void> _createNewChat(String chatId, String user1Id, String text) async {
    await _firestoreInstance.collection('chats').doc(chatId).collection('messages').add({
      'senderId': user1Id,
      'text': text,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> _incrementUnreadCountUsers(String chatId, String user1Id, String user2Id) async {
    await _firestoreInstance.collection('chats').doc(chatId).update({
      'unreadCountUser1': FieldValue.increment(user1Id == user1Id ? 0 : 1),
      'unreadCountUser2': FieldValue.increment(user1Id == user2Id ? 0 : 1),
    });
  }

  Future<void> _updateLastMessage(String chatId, String text) async {
    await _firestoreInstance.collection('chats').doc(chatId).update({
      'lastMessage': text,
      'lastMessageTimestamp': Timestamp.now(),
    });
  }
}
