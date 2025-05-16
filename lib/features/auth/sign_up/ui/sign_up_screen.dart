import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/custom_indicator.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/sign_up_forms_list.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/sign_up_page_view_builder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _FirstSignUpScreenState();
}

class _FirstSignUpScreenState extends State<SignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    final cubit = context.read<SignUpCubit>();

    switch (currentPage) {
      case 0:
        if (!cubit.firstFormKey.currentState!.validate()) return;
        break;
      case 1:
        if (!cubit.secondFormKey.currentState!.validate()) return;
        break;
    }

    if (currentPage < signUpFormsScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => currentPage++);
    } else {
      cubit.emitSignupStates(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('إنشاء حساب', style: TextStyles.font22LavenderBold),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(25),
              CustomIndicator(
                currentPage: currentPage,
                totalPages: signUpFormsScreens.length,
              ),
              verticalSpace(30),
              Expanded(
                child: SignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) => setState(() => currentPage = index),
                ),
              ),
              Column(
                children: [
                  const SignUpBlocListener(),
                  AppTextButton(
                    onPressed: _onNextPage,
                    textButton:
                        currentPage == signUpFormsScreens.length - 1
                            ? 'إنشاء حساب'
                            : 'التالي',
                  ),
                ],
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("تمتلك حساب ؟ ", style: TextStyles.font14BlackMedium),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyles.font14LavenderBold,
                    ),
                  ),
                ],
              ),
              verticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
