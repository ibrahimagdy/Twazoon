import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/features/onboarding/widgets/on_boarding_button.dart';

class OnBoardingNavigation extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final int length;
  final VoidCallback onNextPage;

  const OnBoardingNavigation({
    required this.controller,
    required this.currentPage,
    required this.length,
    required this.onNextPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            //context.pushNamed(Routes.loginScreen);
          },
          child: Text(
            'تخطي',
            style: TextStyles.font16BlackSemiBold
          ),
        ),
        FillableButton(
          onPressed: onNextPage,
          fillColor: ColorsManager.mainLavender,
          textColor: ColorsManager.white,
          progress: (currentPage + 1) / length,
        ),
      ],
    );
  }
}
