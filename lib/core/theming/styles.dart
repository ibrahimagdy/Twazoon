import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twazoon/core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twazoon/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font16BlackMedium = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle font16BlackSemiBold = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle font20BlackMedium = GoogleFonts.cairo(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle font14LavenderMedium = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.mainLavender,
  );
  static TextStyle font14DarkLavenderBold = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainLavenderDark,
  );
  static TextStyle font14BlackMedium = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle font18WhiteMedium = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle font14DarkGeryMedium = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkGrey,
  );
  static TextStyle font22LavenderBold = GoogleFonts.cairo(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainLavender,
  );
}
