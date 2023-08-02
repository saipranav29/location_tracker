import 'package:flutter/material.dart';
import 'package:klimbb/constants/custom_size.dart';
import 'package:klimbb/constants/typography.dart';

Widget textFieldComponent(
    {String? errorText,
    TextAlign textAlign = TextAlign.start,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    String? hintText,
    int maxLines = 1,
    int? minLines,
      required Color fillColor,
      required Color hintTextColor,
    required BuildContext context,
    TextInputType? keyboardType,
    bool readOnly = false,
    String? initialValue,
    Function(String)? onChanged,
    Function()? onTap,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Function(String)? onFieldSubmitted,
    bool isCollapsed = false,
    bool obscureText = false,
    int errorMaxLines = 1,
    }) {
  return TextFormField(
    style:  TextStyle(color: hintTextColor),
    readOnly: readOnly,
    textAlign: textAlign,
    textInputAction: textInputAction,
    obscureText: obscureText,
    onChanged: onChanged,
    onTap: onTap,
    maxLines: maxLines,
    minLines: minLines,
    validator: validator,
    initialValue: initialValue,
    keyboardType: keyboardType,
    onFieldSubmitted: onFieldSubmitted,
    controller: controller,
    decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(4 * paddingRatio)),
          borderSide: BorderSide(
              width: 0.1, color: Theme.of(context).colorScheme.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(4 * paddingRatio)),
          borderSide: BorderSide(
              width: 0.1, color: Theme.of(context).colorScheme.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(4 * paddingRatio)),
          borderSide: BorderSide(
              width: 0.1, color: Theme.of(context).colorScheme.transparent),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 16.0 + 1, // Add error border width to horizontal padding
        ),
        hintText: hintText,
        hintStyle:  TextStyle(color: hintTextColor),
        errorText: errorText,
        errorStyle: Theme.of(context).textTheme.body1.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
        errorMaxLines: errorMaxLines,
        errorBorder: OutlineInputBorder(
            borderRadius:
                const BorderRadius.all(Radius.circular(4 * paddingRatio)),
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.error, // Set error border color
              width: 1,
            )),
        isCollapsed: isCollapsed),
  );
}
