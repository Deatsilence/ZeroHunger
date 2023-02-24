import 'package:flutter/material.dart';
import 'package:zero_hunger/view/auth/onboard/view/onboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.dark().copyWith(),
      home: OnBoardView(),
    );
  }
}
