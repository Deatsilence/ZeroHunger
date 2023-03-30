import 'package:flutter/material.dart';

class ProjectPaddingUtility {
  final EdgeInsets normalHorizontalPadding = const EdgeInsets.symmetric(horizontal: 10);
  final EdgeInsets normalVerticalPadding = const EdgeInsets.symmetric(vertical: 10);
  final EdgeInsets normalHorizontalAndVerticalPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  final EdgeInsets appBarHorizontalAndVerticalPadding = const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5);
  final EdgeInsets scrollBarOnlyRigthPadding = const EdgeInsets.only(right: 5);
  final EdgeInsets scrollBarOnlyLeftPadding = const EdgeInsets.only(right: 5);
  final EdgeInsets categoryButtonsOnlyTopPadding = const EdgeInsets.only(top: 10);
}

class ProjectOnBoardPaddingUtility {
  final EdgeInsets nextButtonPadding = const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
}
