import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/theming/styles.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:twazoon/features/auth/sign_up/ui/widgets/custom_radio_option.dart';

class FirstSignUpFormQuestions extends StatefulWidget {
  const FirstSignUpFormQuestions({super.key});

  @override
  State<FirstSignUpFormQuestions> createState() =>
      _FirstSignUpFormQuestionsState();
}

class _FirstSignUpFormQuestionsState extends State<FirstSignUpFormQuestions> {
  String _hasSleepProblems = 'نعم';
  String _gender = 'ذكر';
  late SignUpCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignUpCubit>();

    cubit.setGender(_gender);
    cubit.setTroubleSleeping(_hasSleepProblems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الجنس:", style: TextStyles.font16BlackMedium),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomRadioOption(
              label: "ذكر",
              value: "ذكر",
              groupValue: _gender,
              onTap: (value) {
                setState(() {
                  _gender = value;
                  cubit.setGender(value);
                });
              },
            ),
            horizontalSpace(80),
            CustomRadioOption(
              label: "أنثى",
              value: "أنثى",
              groupValue: _gender,
              onTap: (value) {
                setState(() {
                  _gender = value;
                  cubit.setGender(value);
                });
              },
            ),
          ],
        ),
        verticalSpace(17),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "هل تعاني من مشاكل في النوم ؟",
              style: TextStyles.font16BlackMedium,
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomRadioOption(
                  label: "نعم",
                  value: "نعم",
                  groupValue: _hasSleepProblems,
                  onTap: (value) {
                    setState(() {
                      _hasSleepProblems = value;
                      cubit.setTroubleSleeping(value);
                    });
                  },
                ),
                horizontalSpace(80),
                CustomRadioOption(
                  label: "لا",
                  value: "لا",
                  groupValue: _hasSleepProblems,
                  onTap: (value) {
                    setState(() {
                      _hasSleepProblems = value;
                      cubit.setTroubleSleeping(value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}