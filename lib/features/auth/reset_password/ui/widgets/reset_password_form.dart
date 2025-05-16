import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/core/helpers/app_validation.dart';
import 'package:twazoon/core/helpers/spacing.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:twazoon/core/widgets/app_text_button.dart';
import 'package:twazoon/core/widgets/app_text_form_field.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:twazoon/features/auth/reset_password/logic/reset_password_state.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = context.read<ResetPasswordCubit>();
        bool isPasswordHidden = true;
        bool isConfirmPasswordHidden = true;
        if (state is StoredDataLoaded) {
          isPasswordHidden = state.isPasswordHidden;
          isConfirmPasswordHidden = state.isConfirmPasswordHidden;
        }

        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'كلمة المرور الجديدة',
                controller: cubit.newPasswordController,
                validator: validatePassword,
                isObscureText: isPasswordHidden,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: isPasswordHidden
                        ? ColorsManager.mainLavender
                        : ColorsManager.black,
                  ),
                  onPressed: cubit.togglePasswordVisibility,
                ),
              ),
              verticalSpace(22),
              AppTextFormField(
                hintText: 'تأكيد كلمة المرور',
                controller: cubit.confirmPasswordController,
                isObscureText: isConfirmPasswordHidden,
                validator: (value) => validateConfirmPassword(
                  value,
                  cubit.newPasswordController.text,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: isConfirmPasswordHidden
                        ? ColorsManager.mainLavender
                        : ColorsManager.black,
                  ),
                  onPressed: cubit.toggleConfirmPasswordVisibility,
                ),
              ),
              verticalSpace(22),
              AppTextButton(
                onPressed: cubit.resetPassword,
                textButton: 'تحديث',
              ),
            ],
          ),
        );
      },
    );
  }
}