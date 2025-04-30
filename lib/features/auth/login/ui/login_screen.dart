import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twazoon/features/auth/login/ui/widgets/login_form.dart';
import 'package:twazoon/features/auth/login/ui/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/svgs/login_curve_line.svg',
                      ),
                    ),
                    Column(children: const [LoginHeader(), LoginForm()]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
