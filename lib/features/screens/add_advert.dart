import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/margin_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/dropDown/custom_dropdown.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';

class AddAdvert extends StatefulWidget {
  const AddAdvert({super.key});

  @override
  State<AddAdvert> createState() => _AddAdvertState();
}

class _AddAdvertState extends State<AddAdvert> {
  AdvertViewModel avm = AdvertViewModel();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      appBar: AppBar(
        title: Text(
          ProjectTextUtility.textAddNewAdvert,
          style: TextThemeUtility()
              .textThemeLogin(context: context, fontSize: ProjectFontSizeUtility.normal, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: ProjectColorsUtility.eveningStar),
        backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  const CustomDropwdown(),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    context: context,
                    text: ProjectTextUtility.textTitle,
                    icon: Icons.title,
                    controller: _titleController,
                    borderColor: ProjectColorsUtility.eveningStar,
                    isPasswordType: false,
                    textinputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    context: context,
                    text: ProjectTextUtility.textDescription,
                    icon: Icons.description_outlined,
                    controller: _descriptionController,
                    borderColor: ProjectColorsUtility.eveningStar,
                    isPasswordType: false,
                    textinputType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLine: null,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (_) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: avm.images.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return index == 0
                                ? InkWell(
                                    onTap: () => avm.chooseImage(),
                                    child: Container(
                                      margin: ProjectMarginUtility().advertImagesAllMargin,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ProjectColorsUtility.grey,
                                          width: 1,
                                        ),
                                        borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add_a_photo_outlined),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: ProjectMarginUtility().advertImagesAllMargin,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ProjectColorsUtility.grey,
                                        width: 1,
                                      ),
                                      borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                                      image: DecorationImage(
                                        image: FileImage(
                                          avm.images[index - 1],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: customElevatedButton(
                      context: context,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
