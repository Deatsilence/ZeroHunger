import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/features/constant/enums/firebase_collections_enum.dart';
import 'package:zero_hunger/features/model/user_model.dart';

mixin FirebaseStoreManagerMixin {
  FirebaseFirestore get _firestoreInstance => FirebaseFirestore.instance;

  Future<void> signUpFirestore(User user) async {
    final docUser = _firestoreInstance.collection(FireBaseCollections.Users.name).doc(user.id);
    final json = user.toJson();
    await docUser.set(json);
  }

  Future<Map<String, dynamic>> getUserFirestore(String documentPath) async {
    final docUser = _firestoreInstance.collection(FireBaseCollections.Users.name).doc(documentPath);
    final response = await docUser.get();
    return response.data() ?? <String, dynamic>{};
  }
}
