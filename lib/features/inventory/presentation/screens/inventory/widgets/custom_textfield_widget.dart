import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final double fontSize;
  final double width;
  final double height;
  final double borderRadius;
  final double marginRight;
  final String regex;
  final bool isNumeric;

  const CustomTextfieldWidget({
    super.key,
    required this.text,
    this.controller,
    required this.fontSize,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.regex = '',
    this.isNumeric = false,
    this.marginRight = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: marginRight),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            width: width,
            height: height,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('$regex')),
              ],
              controller: controller,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(fontSize: fontSize),
              decoration: InputDecoration(
                prefix: isNumeric ? Text('\$') : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
