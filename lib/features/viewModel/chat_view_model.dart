import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
part 'chat_view_model.g.dart';

class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store, FirebaseStoreManagerMixin {
  @observable
  ObservableList<user_model.User> users = ObservableList<user_model.User>();

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void createNewChatWithUserOfAdvert() {}
}
