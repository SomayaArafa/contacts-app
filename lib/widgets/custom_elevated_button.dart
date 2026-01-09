import 'package:contacts_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style:ElevatedButton.styleFrom(
      backgroundColor: AppColors.gold,
      disabledBackgroundColor: AppColors.gold,

      foregroundColor: AppColors.darkBlue,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
      child:  Center(
      child: Text(
     title,
      style: const TextStyle(color: AppColors.lightBlue),
      textAlign: TextAlign.center,
    ),
    ));

  }
}
