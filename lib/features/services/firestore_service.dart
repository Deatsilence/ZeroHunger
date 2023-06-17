import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/features/constant/enums/firebase_collections_enum.dart';
import 'package:zero_hunger/features/model/item_model.dart';
import 'package:zero_hunger/features/model/user_model.dart';
import 'package:zero_hunger/features/viewModel/profile_view_model.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

mixin FirebaseStoreManagerMixin {
  FirebaseFirestore get _firestoreInstance => FirebaseFirestore.instance;
  UserViewModel get _uvm => UserViewModel();

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
}
