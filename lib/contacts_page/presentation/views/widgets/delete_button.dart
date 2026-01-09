import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset('assets/images/Group 33622.png'),
              const Text(
                'Delete',
                style: TextStyle(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
