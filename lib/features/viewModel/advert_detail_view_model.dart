import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;

part 'advert_detail_view_model.g.dart';

class AdvertDetailViewModel = _AdvertDetailViewModelBase with _$AdvertDetailViewModel;

abstract class _AdvertDetailViewModelBase with Store, FirebaseStoreManagerMixin {
  @observable
  bool isloading = false;

  @observable
  String username = "";

  @observable
  int currentIndex = 0;

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  @action
  void increaseCurrentIndex(int index) {
    currentIndex = index;
  }

  Future<void> getUsernameFromFirebase(String documentPath) async {
    changeLoading();
    final user = user_model.User.fromJson(await getUserFirestore(documentPath));
    username = user.name ?? "";
    changeLoading();
  }
}
