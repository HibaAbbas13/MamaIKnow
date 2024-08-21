import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Controllers/SignInSignup_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Authfield.dart';
import 'package:mamaiknow/Screens/Auth/Components/SignInButtons.dart';
import 'package:mamaiknow/Screens/Auth/SignInScreen.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Screens/Components/CommonButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _controller = Get.put(SignUpController());
  final AuthFieldController authFieldController =
      Get.put(AuthFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ksemiTransparentGrey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 33, right: 33, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: AppTypography.kExtraLight12
                      .copyWith(color: AppColors.kWhite),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Create an Account",
                  style: AppTypography.kSemiBold24
                      .copyWith(color: AppColors.klime),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 40.h),
                Form(
                  key: _controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                          style: AppTypography.kExtraLight14
                              .copyWith(color: AppColors.kWhite)),
                      AuthField(
                        hintText: "Enter your Email",
                        icon: "NONE",
                        controller: _controller.emailController,
                      ),
                      Text('Password',
                          style: AppTypography.kExtraLight14
                              .copyWith(color: AppColors.kWhite)),
                      AuthField(
                        hintText: "Enter Password",
                        isPassword: true,
                        icon: "NONE",
                        controller: _controller.passwordController,
                      ),
                      Text('Confirm Password',
                          style: AppTypography.kExtraLight14
                              .copyWith(color: AppColors.kWhite)),
                      AuthField(
                        hintText: "Confirm Password",
                        isPassword: true,
                        icon: "NONE",
                        controller: _controller.confirmPasswordController,
                        password: _controller.passwordController.text,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                CommomButton2(
                    onTap: () {
                      _controller.signUp();
                    },
                    text: 'SignUp'),
                SizedBox(height: 40.h),
                Center(
                  child: Text('or sign up with',
                      style: AppTypography.kExtraLight14
                          .copyWith(color: AppColors.kWhite)),
                ),
                SizedBox(height: 40.h),
                SignInButtons(),
                SizedBox(height: 130.h),
                InkWell(
                  onTap: () {
                    Get.to(const SignInScreen());
                  },
                  child: const Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.white),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD1FF1B)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
