import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/model/user_model.dart' as userModel;
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
part 'profile_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store, FirebaseStoreManagerMixin, FirebaseAuthManagerMixin {
  @observable
  bool isLoading = false;

  @observable
  String username = "";

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getUsername() async {
    changeLoading();
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      final user = userModel.User.fromJson(await getUserFirestore(currentUser.uid));
      username = user.name ?? "";
    }
    changeLoading();
  }
}
