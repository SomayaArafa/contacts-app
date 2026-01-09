import 'package:contacts_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget(
      {super.key,
      required this.image,
      required this.userName,
      required this.userEmail,
      required this.phoneNumber});

  final String image;
  final String userName;
  final String userEmail;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gold,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(image),
              Container(
                width: 84,
                height: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.gold),
                child: Text(userName,style: const TextStyle(color: Colors.black),),
              )
            ],
          ),
          Row(children: [
            Image.asset('assets/images/Exclude.png'),
            const SizedBox(width: 8,),
            Text(userEmail)
,
          ],),
          Row(children: [
            Image.asset('assets/images/Phone_call.png'),
            const SizedBox(width: 8,),
            Text(phoneNumber)
            ,
          ],),
        ],
      ),
    );
  }
}
