import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/helpers/extensions.dart';
import 'package:twazoon/core/helpers/shared_pref_helper.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/routing/routes.dart';
import 'package:twazoon/features/onboarding/model/on_boarding_model.dart';
import 'package:twazoon/features/onboarding/widgets/on_boarding_indicator.dart';
import 'package:twazoon/features/onboarding/widgets/on_boarding_logo.dart';
import 'package:twazoon/features/onboarding/widgets/on_boarding_navigation.dart';
import 'package:twazoon/features/onboarding/widgets/on_boarding_list.dart';
import 'package:twazoon/features/onboarding/widgets/onboarding_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < getOnBoardingList().length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      completeOnboarding(context);
    }
  }

  Future<void> completeOnboarding(BuildContext context) async {
    await SharedPrefHelper.setData(SharedPrefKeys.isFirstLaunch, false);
    await SharedPrefHelper.clearAllSecuredData();
    if(context.mounted){
      context.pushNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = getOnBoardingList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(20),
              const OnBoardingLogo(),
              verticalSpace(19),
              Expanded(
                child: OnBoardingPageView(
                  controller: _controller,
                  onboardingList: onboardingList,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              verticalSpace(36),
              OnBoardingIndicator(
                controller: _controller,
                length: onboardingList.length,
              ),
              verticalSpace(30),
              OnBoardingNavigation(
                controller: _controller,
                currentPage: currentPage,
                length: onboardingList.length,
                onNextPage: _onNextPage,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
