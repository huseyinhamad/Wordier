import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wordier/styles/customized_colors.dart';

class CustomRichText extends StatelessWidget {
  final String description;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.description,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.12,
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      child: Text.rich(
        TextSpan(
            text: description,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              TextSpan(
                  text: text,
                  style: const TextStyle(
                      color: CustomizedColors.blue, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ]),
      ),
    );
  }
}
