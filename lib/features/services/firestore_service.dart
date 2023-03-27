import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/features/constant/enums/firebase_collections_enum.dart';
import 'package:zero_hunger/features/model/item_model.dart';
import 'package:zero_hunger/features/model/user_model.dart';
import 'package:zero_hunger/features/viewModel/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

mixin FirebaseStoreManagerMixin {
  FirebaseFirestore get firestoreInstance => FirebaseFirestore.instance;
  UserViewModel get _uvm => UserViewModel();

  Future<void> signUpFirestore(User user) async {
    _uvm.changeLoading();
    final docUser = firestoreInstance.collection(FireBaseCollections.Users.name).doc(user.id);
    user.createdAt = DateTime.now();
    final json = user.toJson();
    await docUser.set(json);
    _uvm.changeLoading();
  }

  Future<Map<String, dynamic>> getUserFirestore(String documentPath) async {
    _uvm.changeLoading();
    final docUser = firestoreInstance.collection(FireBaseCollections.Users.name).doc(documentPath);
    final response = await docUser.get();
    _uvm.changeLoading();
    return response.data() ?? <String, dynamic>{};
  }

  Future<void> uploadAdvert(Item item) async {
    final docItem = firestoreInstance.collection(FireBaseCollections.Items.name).doc(item.id);
    item.id = docItem.id;
    item.createdAt = DateTime.now().toString();
    final json = item.toJson();
    await docItem.set(json);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyItems(auth.User? user) {
    final querySnapshot =
        firestoreInstance.collection(FireBaseCollections.Items.name).where("userId", isEqualTo: user?.uid).snapshots();
    return querySnapshot;
  }
}
