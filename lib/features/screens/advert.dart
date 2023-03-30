// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';
import 'package:zero_hunger/features/widgets/card/advert_card.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';

class AdvertView extends StatefulWidget {
  const AdvertView({super.key});

  @override
  State<AdvertView> createState() => _AdvertViewState();
}

class _AdvertViewState extends State<AdvertView> with FirebaseStoreManagerMixin, FirebaseAuthManagerMixin {
  final ScrollController _scrollController = ScrollController();

  AdvertViewModel avm = AdvertViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ProjectTextUtility.textMyAdverts,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: avm.streamOfItems(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? ProjectLottieUtility().lottieLoading
                : Padding(
                    padding: ProjectPaddingUtility().scrollBarOnlyLeftPadding,
                    child: RawScrollbar(
                      thickness: 3,
                      controller: _scrollController,
                      thumbVisibility: true,
                      thumbColor: ProjectColorsUtility.eveningStar,
                      radius: ProjectRadiusUtility().scrollBarRadius,
                      child: Padding(
                        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
                        child: ListView.separated(
                          controller: _scrollController,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return (index >= 0 && index < snapshot.data!.docs.length)
                                ? CustomAdvertCard(
                                    advertDate: snapshot.data!.docs[index].get("createdAt").toString(),
                                    pathOfAdvertImage: snapshot.data!.docs[index].get("photoUrls")[0],
                                    description: snapshot.data!.docs[index].get("description"),
                                    onpressed: () async {
                                      await avm.deleteItem(snapshot.data.docs[index].id);
                                    },
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
