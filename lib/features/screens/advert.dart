import 'package:flutter/material.dart';

class AdvertView extends StatefulWidget {
  const AdvertView({super.key});

  @override
  State<AdvertView> createState() => _AdvertViewState();
}

class _AdvertViewState extends State<AdvertView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
