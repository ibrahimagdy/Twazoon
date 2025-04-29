import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/custom_indicator.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/second_sign_up_form.dart';

class SecondSignUpScreen extends StatelessWidget {
  const SecondSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء حساب', style: TextStyles.font22LightLavenderMedium),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(25),
                CustomIndicator(currentPage: 1, totalPages: 2),
                verticalSpace(60),
                const SecondSignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
