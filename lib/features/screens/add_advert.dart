import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/widgets/dropDown/custom_dropdown.dart';

class AddAdvert extends StatefulWidget {
  const AddAdvert({super.key});

  @override
  State<AddAdvert> createState() => _AddAdvertState();
}

class _AddAdvertState extends State<AddAdvert> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      appBar: AppBar(
        title: Text(
          "Add New Advert",
          style: TextThemeUtility()
              .textThemeLogin(context: context, fontSize: ProjectFontSizeUtility.normal, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: ProjectColorsUtility.eveningStar),
        backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: const [
                  CustomDropwdown(),
                  // CustomTextFormField(
                  //   context: context,
                  //   text: "Title",
                  //   icon: Icons.title,
                  //   controller: _titleController,
                  //   borderColor: ProjectColorsUtility.eveningStar,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
