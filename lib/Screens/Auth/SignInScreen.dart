import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/SignInSignup_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Authfield.dart';
import 'package:mamaiknow/Screens/Auth/Components/SignInButtons.dart';
import 'package:mamaiknow/Screens/Auth/SignUpScreen.dart';
import 'package:mamaiknow/Screens/Components/CommonButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ksemiTransparentGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 84, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: AppTypography.kExtraLight12
                      .copyWith(color: AppColors.kWhite),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Hello!",
                  style: AppTypography.kSemiBold24
                      .copyWith(color: AppColors.klime),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 40.h),
                Form(
                  key: controller.formKey,
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email',
                            style: AppTypography.kExtraLight14
                                .copyWith(color: AppColors.kWhite)),
                      ),
                      AuthField(
                        hintText: "Enter Your Email",
                        icon: "NONE",
                        controller: controller.emailController,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Password',
                              style: AppTypography.kExtraLight14
                                  .copyWith(color: AppColors.kWhite))),
                      AuthField(
                        hintText: "Enter Password",
                        isPassword: true,
                        icon: "NONE",
                        controller: controller.passwordController,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(color: AppColors.klime),
                            textAlign: TextAlign.end,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                CommomButton2(
                    onTap: () {
                      controller.signIn();
                    },
                    text: "Sign In"),
                SizedBox(height: 40.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('or sign up with',
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kWhite))),
                SizedBox(height: 40.h),
                SignInButtons(),
                SizedBox(height: 186.h),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignUpScreen());
                    Get.delete<SignInController>();
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: 'Dont have an account? ',
                        style: TextStyle(color: Colors.white),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign Up',
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
