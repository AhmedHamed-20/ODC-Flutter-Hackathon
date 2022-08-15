import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

Widget defaultTextFormField({
  required double width,
  required double height,
  TextEditingController? controller,
  TextInputType? keyboardType,
  required double radius,
  TextStyle? labelStyle,
  Widget? suffixIcon,
  Widget? prefixIcon,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onSubmit,
  bool obscureText = false,
  int maxLine = 1,
  TextDirection textDirection = TextDirection.ltr,
  required BuildContext context,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      maxLines: maxLine,
      textDirection: textDirection,
      style: Theme.of(context).textTheme.bodyText1,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.all(AppPadding.p20),
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColorGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColorGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmit,
    ),
  );
}

Widget defaultButton({
  required VoidCallback onPressed,
  required Widget buttonChild,
  required double width,
  required double height,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: MaterialButton(
      onPressed: onPressed,
      color: AppColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppRadius.r5,
        ),
      ),
      child: buttonChild,
    ),
  );
}
