import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/colors.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 80,
        ),
        Lottie.asset(
          'assets/animations/empty_list.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
        const Center(
          child: Text(
            'There is No Contacts Added Here',
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
