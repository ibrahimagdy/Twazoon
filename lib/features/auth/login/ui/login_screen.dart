import 'package:flutter/material.dart';
import 'package:twazoon/features/auth/login/ui/widgets/login_form.dart';
import 'package:twazoon/features/auth/login/ui/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: const [LoginHeader(), LoginForm()]),
        ),
      ),
    );
  }
}
