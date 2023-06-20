import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/features/constant/enums/firebase_collections_enum.dart';
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
    final querySnapshot =
        _firestoreInstance.collection(FireBaseCollections.Items.name).where("userId", isEqualTo: user?.uid).snapshots();
    return querySnapshot;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllItemsService() {
    final querySnapshot = _firestoreInstance.collection(FireBaseCollections.Items.name).snapshots();
    return querySnapshot;
  }

  //[START] Chat

  // Future<void> sendMessage(String chatId, String senderId, String text) async {
  //   // Create a new message document.
  //   Map<String, dynamic> message = {
  //     'senderId': senderId,
  //     'text': text,
  //     'timestamp': DateTime.now(),
  //   };

  //   // Add the message to the chat document.
  //   DatabaseReference chatRef = _database.ref('chats/$chatId');
  //   await chatRef.update({
  //     'messages': FieldValue.arrayUnion([message]),
  //   });

  //   // Update the unread count for the other user.
  //   DatabaseReference otherUserRef = _database.ref('users/$senderId');
  //   await otherUserRef.update({
  //     'unreadCountUser2': FieldValue.increment(1),
  //   });
  // }

  // Future<List<Chat>> getChats() async {
  //   // Get the chats collection.
  //   QuerySnapshot snapshot = await _database.ref('chats').get();

  //   // Get the chats from the collection.
  //   List<Chat> chats = snapshot.docs.map((doc) => Chat.fromJson(doc.data())).toList();

  //   // Update the unread count for each chat.
  //   for (Chat chat in chats) {
  //     DatabaseReference chatRef = _database.ref('chats/$chat.chatId');
  //     await chatRef.update({
  //       'unreadCountUser1': FieldValue.increment(-1),
  //       'unreadCountUser2': FieldValue.increment(-1),
  //     });
  //   }

  //   return chats;
  // }
}
