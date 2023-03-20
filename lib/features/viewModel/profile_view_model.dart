import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/model/user_model.dart' as userModel;
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
part 'profile_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store, FirebaseStoreManagerMixin, FirebaseAuthManagerMixin {
  @observable
  String username = "";

  @action
  Future<void> getUsername() async {
    if (instance.currentUser != null) {
      final user = userModel.User.fromJson(await getUserFirestore(instance.currentUser!.uid));
      username = user.name ?? "";
    }
  }
}
