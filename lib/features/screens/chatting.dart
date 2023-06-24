import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/model/chat_model.dart';
import 'package:zero_hunger/features/viewModel/chat_view_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  final List<Chat> chatsOfUser = [];

  @override
  Widget build(BuildContext context) {
    final ChatViewModel cvm = ChatViewModel();

    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    cvm.getUsernameFromFirebase(arg[ProjectTextUtility.textUserIdOfItemStorage]);

    final widthOfDevice = MediaQuery.of(context).size.width;
    final heightOfDevice = MediaQuery.of(context).size.height;

    return Observer(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          title: cvm.username,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
          child: SizedBox(
            width: widthOfDevice,
            height: heightOfDevice,
            child: const Column(
              children: [],
            ),
          ),
        ),
      );
    });
  }
}
