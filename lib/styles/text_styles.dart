import 'package:flutter/material.dart';
import 'package:wordier/styles/customized_colors.dart';

class TextStyles {
  static const headerTextStyle = TextStyle(
      color: CustomizedColors.whiteshade,
      fontSize: 28,
      fontWeight: FontWeight.w700);

  static const textFieldHeading =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static const textFieldHintStyle = TextStyle(
      color: CustomizedColors.hintText,
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static const authButtonTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: CustomizedColors.whiteshade);
}
