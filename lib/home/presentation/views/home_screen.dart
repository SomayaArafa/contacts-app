import 'package:contacts_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        appBar: AppBar(
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
        ),
        floatingActionButton: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.gold,
            child: const Icon(
              Icons.add,
              color: AppColors.darkBlue,
              size: 26,
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 80,),
            Lottie.asset(
              'assets/animations/empty_list.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            const Center(
              child: Text(
                'There is No Contacts Added Here',
                style: TextStyle(color: AppColors.gold, fontSize: 20,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
