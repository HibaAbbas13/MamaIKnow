import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Validation.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final bool isConfirmPassword;
  final String hintText;
  final String icon;
  final String? password;

  AuthField({
    Key? key,
    required this.controller,
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.hintText,
    required this.icon,
    this.password,
  }) : super(key: key);

  final AuthFieldController _authFieldController =
      Get.find<AuthFieldController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: TextFormField(
            controller: controller,
            obscureText: (isPassword || isConfirmPassword)
                ? _authFieldController.isObscure.value
                : false,
            validator: (value) {
              if (isPassword) {
                return CustomValidator.validatePassword(value);
              } else if (isConfirmPassword) {
                return CustomValidator.validateConfirmPassword(
                    value, password ?? '');
              } else {
                return CustomValidator.validateUsername(value);
              }
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: AppColors.kWhite),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide:
                    BorderSide(color: AppColors.kblueGrey, width: 1.0.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide:
                    BorderSide(color: AppColors.kblueGrey, width: 1.0.w),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide:
                    BorderSide(color: AppColors.kblueGrey, width: 1.0.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide:
                    BorderSide(color: AppColors.kblueGrey, width: 1.0.w),
              ),
              filled: true,
              fillColor: AppColors.kblueGrey,
              hintText: hintText,
              hintStyle:
                  AppTypography.kLight12.copyWith(color: AppColors.kWhite),
              suffixIcon: (isPassword || isConfirmPassword)
                  ? IconButton(
                      icon: Icon(
                        _authFieldController.isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.kWhite,
                      ),
                      onPressed: _authFieldController.toggleObscure,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
