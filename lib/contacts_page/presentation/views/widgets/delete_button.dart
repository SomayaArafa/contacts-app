import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.onDelete, });
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onDelete,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Group 33622.png'),
              const SizedBox(width: 8,),
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
