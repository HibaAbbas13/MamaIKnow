import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Auth/Components/Authfield.dart';
import 'package:mamaiknow/Services/auth_service.dart';
import 'package:mamaiknow/widgets/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(24.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text('Forgot your password?',
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false),
                        style: AppTypography.kBold32
                            .copyWith(color: AppColors.kWhite)),
                    Text("No worries, we'll help you reset it.",
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false),
                        style: AppTypography.kLight14),
                    SizedBox(height: 40.h),
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
                    SizedBox(height: 60.h),
                    PrimaryButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _auth.resetPassword(email: _emailController.text);
                          }
                        },
                        text: 'Sign In',
                        textColor: AppColors.kWhite,
                        bgColor: AppColors.kPrimary)
                  ],
                ),
              ))),
    );
  }
}
