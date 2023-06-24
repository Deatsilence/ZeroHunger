import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/model/chat_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<Chat> chatsOfUser = [];

  @override
  Widget build(BuildContext context) {
    final widthOfDevice = MediaQuery.of(context).size.width;
    final heightOfDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        title: ProjectTextUtility.textInbox,
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
        child: SizedBox(
          width: widthOfDevice,
          height: heightOfDevice,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
