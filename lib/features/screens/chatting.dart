import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zero_hunger/features/constant/paths_assets/path_of_blank_avatar.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/viewModel/chat_view_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';
import 'package:zero_hunger/features/widgets/customContainer/custom_container.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  final TextEditingController _messageTextController = TextEditingController();
  final ChatViewModel cvm = ChatViewModel();

  @override
  void setState(VoidCallback fn) {
    _messageTextController.selection = TextSelection.collapsed(offset: _messageTextController.text.length);
    super.setState(fn);
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var userId = arg[ProjectTextUtility.textUserIdOfItemStorage];

    cvm.getUsernameFromFirebase(userId);
    cvm.getAvatarOfAdvertOwnerFromFirebase(userId);

    final widthOfDevice = MediaQuery.of(context).size.width;
    final heightOfDevice = MediaQuery.of(context).size.height;

    return Observer(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          rightWidget: SizedBox(
            height: heightOfDevice * 0.04,
            width: widthOfDevice * 0.1,
            child: _avatarOfTheUser(cvm),
          ),
          title: cvm.username,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SizedBox(
          width: widthOfDevice,
          height: heightOfDevice,
          child: CustomContainer(
            height: heightOfDevice * 0.8,
            child: Column(
              children: [
                CustomTextFormField(
                  focusedBorderColor: ProjectColorsUtility.eveningStar,
                  borderColor: ProjectColorsUtility.grey,
                  context: context,
                  text: "",
                  suffixIcon: Icons.send_outlined,
                  controller: _messageTextController,
                  isPasswordType: false,
                  textinputType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  CircleAvatar _avatarOfTheUser(ChatViewModel cvm) {
    return CircleAvatar(
      radius: 60,
      child: ClipRRect(
        borderRadius: ProjectBorderRadiusUtility().categoryBorderRadius,
        child: cvm.photoUrl != ""
            ? FadeInImage.memoryNetwork(
                key: UniqueKey(),
                placeholder: kTransparentImage,
                image: cvm.photoUrl,
                fit: BoxFit.cover,
              )
            : Image.asset(
                PathOfBlankAvatar().path,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
