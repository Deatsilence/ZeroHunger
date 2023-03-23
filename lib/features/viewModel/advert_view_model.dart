import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/constant/enums/name_of_categories_enum.dart';
import 'package:zero_hunger/features/extensions/string_extensions.dart';
part 'advert_view_model.g.dart';

class AdvertViewModel = _AdvertViewModelBase with _$AdvertViewModel;

abstract class _AdvertViewModelBase with Store {
  @observable
  bool isStrechedDropwDown = false;

  @observable
  final items = [
    Categories.food.name.capitalize(),
    Categories.drink.name.capitalize(),
    Categories.sweet.name.capitalize(),
    Categories.snack.name.capitalize(),
  ];

  @observable
  String? value;

  @action
  void setValue(String newValue) {
    value = newValue;
  }

  @action
  void changeIsStrechedDropwDown() {
    isStrechedDropwDown = !isStrechedDropwDown;
  }
}
