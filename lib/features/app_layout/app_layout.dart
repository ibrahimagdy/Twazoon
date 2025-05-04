import 'package:flutter/material.dart';
import 'package:twazoon/core/theming/styles.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Home', style: TextStyles.font20BlackMedium)),
        ],
      ),
    );
  }
}
