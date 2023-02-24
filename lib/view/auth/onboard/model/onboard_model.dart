import 'package:flutter/material.dart';
import 'package:zero_hunger/view/auth/onboard/paths/path_manager.dart';

class OnBoardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnBoardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnBoardModel> screens = <OnBoardModel>[
  OnBoardModel(
    img: OnBoardImagesPaths.onboard1.path(),
    text: "text",
    desc: "desc",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: OnBoardImagesPaths.onboard2.path(),
    text: "text",
    desc: "desc",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: OnBoardImagesPaths.onboard3.path(),
    text: "text",
    desc: "desc",
    bg: Colors.white,
    button: Colors.blue,
  ),
];
