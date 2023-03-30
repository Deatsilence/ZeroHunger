import 'package:flutter/material.dart';

class AdvertDetail extends StatefulWidget {
  const AdvertDetail({super.key});

  @override
  State<AdvertDetail> createState() => _AdvertDetailState();
}

class _AdvertDetailState extends State<AdvertDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network("https://picsum.photos/200"),
          ),
        ],
      ),
    );
  }
}
