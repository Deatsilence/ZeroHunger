import 'package:mobx/mobx.dart';
part 'advert_view_model.g.dart';

class AdvertViewModel = _AdvertViewModelBase with _$AdvertViewModel;

abstract class _AdvertViewModelBase with Store {
  @observable
  bool isStrechedDropwDown = false;

  @action
  void changeIsStrechedDropwDown() {
    isStrechedDropwDown = !isStrechedDropwDown;
  }
}
