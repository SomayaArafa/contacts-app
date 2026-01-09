import 'dart:io';

import 'package:contacts_app/contacts_page/presentation/views/widgets/contact_model.dart';
import 'package:contacts_app/contacts_page/presentation/views/widgets/delete_button.dart';
import 'package:contacts_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.contact, required this.onDelete,
  });

  final ContactModel contact;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.gold,
      ),
      child: Column(
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24)),
                    child: Image.file(
                      width: double.infinity,
                      height: double.infinity,
                      File(contact.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,left: 6.0),
                      child: Container(
                        width: 84,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.gold),
                        child: Center(
                          child: Text(
                            contact.userName,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Image.asset('assets/images/Exclude.png'),
              const SizedBox(
                width: 8,
              ),
              Text(contact.email),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Image.asset('assets/images/Phone_call.png'),
              const SizedBox(
                width: 8,
              ),
              Text(contact.phoneNumber),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DeleteButton(onDelete: onDelete,),
          )
        ],
      ),
    );
  }
}
