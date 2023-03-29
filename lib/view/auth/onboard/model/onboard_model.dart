import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/path_manager.dart';

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
    img: OnBoardImagesPaths.onboard1.path,
    text: "Do you have too much food or drink?",
    desc: "",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: OnBoardImagesPaths.onboard2.path,
    text: "Don't want to throw away your leftover meal?",
    desc: "According to the United Nations 2021 Food Waste Index Report, global food waste is approaching 1.3 tons.",
    bg: Colors.white,
    button: Colors.blue,
  ),
  OnBoardModel(
    img: OnBoardImagesPaths.onboard3.path,
    text: "Let's reach sharing saturation!",
    desc:
        "According to the international humanitarian organization Oxfam, one person dies of hunger every 11 minutes in the world.",
    bg: Colors.white,
    button: Colors.blue,
  ),
];
