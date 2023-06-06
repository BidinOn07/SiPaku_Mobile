import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constans/app_constants.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    this.placeholders,
    this.inputAction,
    this.inputType,
    this.maxLines,
    this.errorText,
    this.helper,
    this.suffixIcon,
    this.readOnly,
    this.inputFormatters,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String? placeholders;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final int? maxLines;
  final String? errorText;
  final String? helper;
  final Widget? suffixIcon;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        helperText: helper,
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: const EdgeInsets.all(kSpacing / 2),
        hintText: placeholders ?? "",
        errorText: errorText,
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          color: kColorDanger,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius / 2),
          borderSide: BorderSide(
            color: kFontColorPallets[2],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius / 2),
          borderSide: const BorderSide(
            color: kColorPrimary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius / 2),
          borderSide: const BorderSide(
            color: kColorDanger,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius / 2),
          borderSide: const BorderSide(
            color: kColorDanger,
          ),
        ),
      ),
    );
  }
}
