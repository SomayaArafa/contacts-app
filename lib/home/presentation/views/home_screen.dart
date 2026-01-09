import 'dart:io';

import 'package:contacts_app/contacts_page/presentation/views/contacts_grid_view.dart';
import 'package:contacts_app/home/presentation/views/widgets/home_body_widget.dart';
import 'package:contacts_app/home/presentation/views/widgets/user_details_widget.dart';
import 'package:contacts_app/utils/colors.dart';
import 'package:contacts_app/widgets/custom_elevated_button.dart';
import 'package:contacts_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../contacts_page/presentation/views/widgets/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  List<ContactModel> contacts = [];

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        appBar: buildAppBar(),
        floatingActionButton: Stack(children: [
          if(contacts.length<=6)
          Positioned(
            bottom: 16,
            right: 16,
            child: SizedBox(
              width: 65,
              height: 65,
              child: FloatingActionButton(
                backgroundColor: AppColors.gold,
                onPressed: () async {
                  final result = await buildShowModalBottomSheet(context);

                  if (result != null) {
                    setState(() {
                      contacts.add(result);
                    });
                  }
                },
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ),
          if (contacts.isNotEmpty)
            Positioned(
              bottom: 90,
              right: 16,
              child: SizedBox(
                width: 65,
                height: 65,
                child: FloatingActionButton(
                  backgroundColor: AppColors.red,
                  onPressed: () {
                    setState(() {
                      contacts.removeLast();
                    });
                  },
                  child: const Icon(Icons.delete, size: 20,color: AppColors.white,),
                ),
              ),
            ),
        ]),
        body: HomeBodyWidget(
          contacts: contacts,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      leadingWidth: 200,
      toolbarHeight: 100,
      title: Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset(
          'assets/images/Group 6.png',
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future<ContactModel?> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<ContactModel>(
      backgroundColor: AppColors.lightBlue,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery,
                                  );

                                  if (image != null) {
                                    setModalState(() {
                                      selectedImage = File(image.path);
                                    });
                                  }
                                },
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: AppColors.gold),
                                  ),
                                  child: selectedImage == null
                                      ? Lottie.asset(
                                          'assets/animations/image_picker.json',
                                          fit: BoxFit.contain,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.file(
                                            selectedImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: UserDetailsWidget(
                                  nameController: nameController,
                                  emailController: emailController,
                                  phoneController: phoneController),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Enter User Name',
                          onChanged: (_) => setModalState(() {}),
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Enter User Email',
                          onChanged: (_) => setModalState(() {}),
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: phoneController,
                          hintText: 'Enter User Phone',
                          onChanged: (_) => setModalState(() {}),
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(height: 14),
                        InkWell(
                            onTap: () {
                              final contact = ContactModel(
                                userName: nameController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                image: selectedImage!.path,
                              );
                              Navigator.pop(context, contact);
                            },
                            child: const CustomElevatedButton(
                                title: 'Enter user')),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
