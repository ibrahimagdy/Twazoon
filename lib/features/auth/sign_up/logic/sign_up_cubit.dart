import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twazoon/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:twazoon/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:twazoon/features/auth/sign_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  String _gender = 'ذكر';
  bool _troubleSleeping = true;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController facultyController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController lastGradeController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> firstFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();

  void setGender(String gender) {
    _gender = gender;
  }

  void setTroubleSleeping(String value) {
    _troubleSleeping = value == 'نعم';
  }

  void emitSignupStates(BuildContext context) async {
    emit(const SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestModel(
        faculty: facultyController.text,
        level: levelController.text,
        lastGrade: int.tryParse(lastGradeController.text) ?? 0,
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        gender: _gender,
        troubleSleeping: _troubleSleeping,
      ),
    );

    response.when(success: (signupResponse) async {
      emit(SignUpState.signUpSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signUpError(error: error));
    });
  }

  @override
  Future<void> close() {
    facultyController.dispose();
    levelController.dispose();
    lastGradeController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}