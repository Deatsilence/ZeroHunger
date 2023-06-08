import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/margin_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/mixin/validator_mixin.dart';
import 'package:zero_hunger/features/model/item_model.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/dropDown/custom_dropdown.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';

class AddAdvert extends StatefulWidget {
  const AddAdvert({super.key});

  @override
  State<AddAdvert> createState() => _AddAdvertState();
}

class _AddAdvertState extends State<AddAdvert> with ValidatorMixin {
  AdvertViewModel avm = AdvertViewModel();

  final TextEditingController _searchLocationController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  String? _location;
  String? _title;
  String? _description;
  String? _category;

  @override
  void initState() {
    super.initState();
    _searchLocationController.addListener(() {
      avm.onChange(_searchLocationController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _searchLocationController.dispose();
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
                  CustomTextFormField(
                    context: context,
                    text: ProjectTextUtility.textLocation,
                    icon: Icons.location_on_outlined,
                    controller: _searchLocationController,
                    borderColor: ProjectColorsUtility.eveningStar,
                    isPasswordType: false,
                    textinputType: TextInputType.streetAddress,
                    suffixIcon: Icons.clear_outlined,
                    validator: _locationValidator,
                    onSaved: (value) {
                      _location = value;
                    },
                  ),
                  Flexible(
                    child: Observer(builder: (_) {
                      return ListView.builder(
                        itemCount: avm.placesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              if (avm.placesList[index] != null) {
                                _location =
                                    avm.placesList[index][ProjectTextUtility.textDescription.toLowerCase()].toString();
                                _searchLocationController.text = _location!;
                                _searchLocationController.selection = TextSelection.fromPosition(
                                    TextPosition(offset: _searchLocationController.text.length));
                              }
                            },
                            title: Text(
                                avm.placesList[index][ProjectTextUtility.textDescription.toLowerCase()].toString()),
                            leading: const Icon(Icons.location_on_outlined),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  CustomDropwdown(
                    onSaved: (value) {
                      _category = value;
                    },
                    onChanged: (String value) => _category = value,
                    validator: _categoryValidator,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    context: context,
                    text: ProjectTextUtility.textTitle,
                    icon: Icons.title,
                    controller: _titleController,
                    borderColor: ProjectColorsUtility.eveningStar,
                    isPasswordType: false,
                    textinputType: TextInputType.text,
                    suffixIcon: Icons.clear_outlined,
                    validator: _titleValidator,
                    onSaved: (value) {
                      _title = value;
                    },
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
                    suffixIcon: Icons.clear_outlined,
                    validator: _descriptionValidator,
                    onSaved: (value) {
                      _description = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  _imagesOfAdvert(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: CustomElevatedButton(
                      context: context,
                      text: ProjectTextUtility.textApp,
                      onPressed: _addAdvert,
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

  String? _locationValidator(String? location) {
    if (location != null && location.isNotEmpty && location.length <= 100) {
      return null;
    } else {
      return ProjectTextUtility.textTitleValidate;
    }
  }

  String? _categoryValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return ProjectTextUtility.textCategoryValidate;
    }
  }

  String? _titleValidator(String? title) {
    if (title != null && title.isNotEmpty && title.length <= 30) {
      return null;
    } else {
      return ProjectTextUtility.textTitleValidate;
    }
  }

  String? _descriptionValidator(String? description) {
    if (description != null && description.isNotEmpty && description.length <= 100) {
      return null;
    } else {
      return ProjectTextUtility.textDescriptionValidate;
    }
  }

  Future<void> _addAdvert() async {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate() && avm.images.isNotEmpty) {
        formGlobalKey.currentState!.save();

        final advert = Item(
          categoryName: _category,
          title: _title,
          description: _description,
          location: _location,
        );

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Center(
            child: ProjectLottieUtility().lottieLoading,
          ),
        ).whenComplete(() => Navigator.of(context).pop());

        await avm.uploadAdvertToirebase(advert, avm.images).whenComplete(() {
          Navigator.of(context).pop();
        });
      }
    }
  }

  Expanded _imagesOfAdvert() {
    return Expanded(
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
    );
  }
}
