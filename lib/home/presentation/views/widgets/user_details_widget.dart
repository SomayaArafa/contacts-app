import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameController.text.isEmpty ? 'User Name' : nameController.text,
          style: const TextStyle(color: AppColors.gold),
        ),
        const Divider(color: AppColors.gold),
        Text(
          emailController.text.isEmpty
              ? 'example@email.com'
              : emailController.text,
          style: const TextStyle(color: AppColors.gold),
        ),
        const Divider(color: AppColors.gold),
        Text(
          phoneController.text.isEmpty ? '+200000000000' : phoneController.text,
          style: const TextStyle(color: AppColors.gold),
        ),
      ],
    );
  }
}
