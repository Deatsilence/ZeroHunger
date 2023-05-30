import 'package:flutter/material.dart';

class ProjectPaddingUtility {
  final EdgeInsets normalAllPadding = const EdgeInsets.all(20);
  final EdgeInsets normalHorizontalPadding = const EdgeInsets.symmetric(horizontal: 10);
  final EdgeInsets normalVerticalPadding = const EdgeInsets.symmetric(vertical: 10);
  final EdgeInsets normalHorizontalAndVerticalPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  final EdgeInsets appBarHorizontalAndVerticalPadding = const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5);
  final EdgeInsets scrollBarOnlyRigthPadding = const EdgeInsets.only(right: 5);
  final EdgeInsets scrollBarOnlyLeftPadding = const EdgeInsets.only(right: 5);
  final EdgeInsets categoryButtonsOnlyTopPadding = const EdgeInsets.only(top: 10);
  final EdgeInsets dividerVerticalPadding = const EdgeInsets.symmetric(vertical: 15.0);
  final EdgeInsets draggableScrollIconOnlyPadding = const EdgeInsets.only(top: 10, bottom: 25);
  final EdgeInsets advertDetailProfileNameOnlyPadding = const EdgeInsets.only(left: 8.0);
  final EdgeInsets advertDetailImagesPagesIconOnlyPadding = const EdgeInsets.symmetric(horizontal: 3.0);
  final EdgeInsets advertDetailCurrentImagesPageIconsOnlyPadding = const EdgeInsets.only(bottom: 20.0);
  final EdgeInsets advertDetailBackArrowButtonAllPadding = const EdgeInsets.fromLTRB(20, 50, 20, 0);
}

class ProjectOnBoardPaddingUtility {
  final EdgeInsets nextButtonPadding = const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
}
