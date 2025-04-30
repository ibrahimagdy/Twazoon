import 'package:flutter/material.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/sign_up_forms_list.dart';

class SignUpPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const SignUpPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: signUpFormsScreens.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => signUpFormsScreens[index],
    );
  }
}
