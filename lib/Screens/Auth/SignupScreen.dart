import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Authfield.dart';
import 'package:mamaiknow/Screens/Auth/SignInScreen.dart';

import 'package:mamaiknow/Screens/CommonWidgets/common%20_scoialbutoons.dart';

import 'package:mamaiknow/Services/auth_service.dart';
import 'package:mamaiknow/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  final bool isFromWelcome;
  const SignUpScreen({super.key, this.isFromWelcome = false});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text('Hello,',
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false),
                    style: AppTypography.kBold24
                        .copyWith(color: AppColors.kPrimary)),
                Text("Create an account!",
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false),
                    style: AppTypography.kBold32
                        .copyWith(color: AppColors.kPrimary)),
                SizedBox(height: 50.h),
                AuthField(
                  label: 'Email address',
                  controller: _emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.isEmail) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                AuthField(
                  label: 'Password',
                  controller: _passwordController,
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password.';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                AuthField(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  hint: 'Confirm your password',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 54.h),
                Center(
                  child: Text(
                    'or sign in with',
                    style: AppTypography.kExtraLight12
                        .copyWith(color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (Platform.isIOS) ...[
                      CustomSocialButtons(
                          onTap: () {
                            _auth.signInWithApple(isFromSignIn: false);
                          },
                          icon: AppIcons.apple),
                      SizedBox(width: 24.w),
                    ],
                    CustomSocialButtons(
                        onTap: () {
                          _auth.signInWithGoogle(isFromSignIn: true);
                        },
                        icon: AppIcons.google),
                  ],
                ),
                SizedBox(height: 54.h),
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an account ?",
                          style: AppTypography.kLight14
                              .copyWith(color: AppColors.kPrimary),
                          children: [
                        TextSpan(
                          text: "  Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                  () => const SignInScreen(isFromLogin: true));
                            },
                          style: AppTypography.kBold16
                              .copyWith(color: AppColors.kPrimary),
                        )
                      ])),
                ),
                SizedBox(height: 24.h),
                PrimaryButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _auth.signUpWithEmailAndPassword(
                            emailAddress: _emailController.text,
                            password: _passwordController.text,
                            isFromWelcome: widget.isFromWelcome);
                      }
                    },
                    text: 'Sign Up',
                    textColor: AppColors.kWhite,
                    bgColor: AppColors.kPrimary)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
