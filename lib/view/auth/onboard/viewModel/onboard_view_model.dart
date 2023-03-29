import 'package:mobx/mobx.dart';
part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void increaseCurrentIndex(int index) {
    currentIndex = index;
  }
}
