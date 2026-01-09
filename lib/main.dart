import 'package:contacts_app/contacts_page/presentation/views/contacts_grid_view.dart';
import 'package:contacts_app/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: HomeScreen(),

    );
  }
}
