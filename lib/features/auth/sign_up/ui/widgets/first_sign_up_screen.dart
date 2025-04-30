import 'package:flutter/material.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/first_sign_up_form_fields.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/first_sign_up_form_questions.dart';

class FirstSignUpScreen extends StatelessWidget {
  const FirstSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FirstSignUpFormFields(),
        const FirstSignUpFormQuestions(),
      ],
    );
  }
}
