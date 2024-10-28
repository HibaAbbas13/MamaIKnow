import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Validation.dart';

class AuthField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool isReadOnly;
  const AuthField(
      {super.key,
      required this.hint,
      required this.label,
      required this.controller,
      this.validator,
      this.textInputAction,
      this.keyboardType,
      this.isReadOnly = false,
      this.isPassword = false});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.isPassword ? isObscure : false,
            textInputAction: widget.textInputAction,

            keyboardType: widget.keyboardType,
            cursorColor: AppColors.kPrimary,
            readOnly: widget.isReadOnly,
            style:
                TextStyle(color: AppColors.kPrimary), // Change to primary color
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0.r),
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0.r),
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0.r),
                  borderSide:
                      BorderSide(color: colorScheme.error, width: 1.0.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0.r),
                  borderSide:
                      BorderSide(color: colorScheme.error, width: 1.0.w),
                ),
                filled: true,
                fillColor: colorScheme.onPrimary,
                hintStyle:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
                hintText: widget.hint,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.kPrimary,
                        ))
                    : null),
            //input text color
          ),
        ),
      ],
    );
  }
}
