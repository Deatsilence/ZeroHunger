// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';
import 'package:zero_hunger/features/widgets/card/advert_card.dart';

class AdvertView extends StatefulWidget {
  const AdvertView({super.key});

  @override
  State<AdvertView> createState() => _AdvertViewState();
}

class _AdvertViewState extends State<AdvertView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ProjectTextUtility.textMyAdverts,
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Divider(thickness: 2),
              CustomAdvertCard(
                advertDate: DateTime.now(),
                pathOfAdvertImage: "https://picsum.photos/200",
                description: "description",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
