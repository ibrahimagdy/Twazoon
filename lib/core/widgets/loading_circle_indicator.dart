import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/colors_manger.dart';

class LoadingCircleIndicator extends StatelessWidget {
  const LoadingCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainLavender,
      ),
    );
  }
}
