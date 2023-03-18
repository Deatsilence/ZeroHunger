import 'package:cloud_firestore/cloud_firestore.dart';

mixin FirebaseStoreManagerMixin {
  FirebaseFirestore get instance => FirebaseFirestore.instance;
}
