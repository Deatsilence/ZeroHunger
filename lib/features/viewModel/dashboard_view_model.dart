import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase with Store, FirebaseAuthManagerMixin, FirebaseStoreManagerMixin {
  @observable
  bool isScrollVisible = true;

  Stream<QuerySnapshot<Map<String, dynamic>>>? streamOfItems() {
    final myItems = getAllItems();
    return myItems;
  }
}
