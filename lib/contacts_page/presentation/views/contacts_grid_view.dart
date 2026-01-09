import 'package:contacts_app/contacts_page/presentation/views/widgets/contact_model.dart';
import 'package:contacts_app/contacts_page/presentation/views/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class ContactsGridView extends StatefulWidget {
  const ContactsGridView({super.key, required this.contacts, });

  final List<ContactModel> contacts;

  @override
  State<ContactsGridView> createState() => _ContactsGridViewState();
}

class _ContactsGridViewState extends State<ContactsGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.contacts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ContactWidget(contact: widget.contacts[index], onDelete: () {  setState(() {
          widget.contacts.removeAt(index);
        }); }, );
      },
    );
  }
}
