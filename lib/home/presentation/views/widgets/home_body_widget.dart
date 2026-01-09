import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../contacts_page/presentation/views/contacts_grid_view.dart';
import '../../../../contacts_page/presentation/views/widgets/contact_model.dart';
import '../../../../utils/colors.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({
    super.key,
    required this.contacts,
  });

  final List<ContactModel> contacts;

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.contacts.isEmpty) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 80),
            Lottie.asset(
              'assets/animations/empty_list.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            const Text(
              'There is No Contacts Added Here',
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return ContactsGridView(contacts: widget.contacts,);
  }
}
