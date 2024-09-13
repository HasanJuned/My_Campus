import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_otp_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

class StuSignUpScreen extends StatefulWidget {
  const StuSignUpScreen({super.key, required this.email});
  final String email;

  @override
  State<StuSignUpScreen> createState() => _StuSignUpScreenState();
}

class _StuSignUpScreenState extends State<StuSignUpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TitleAndSubtitle(
                      title: 'SIGN UP', subtitle: 'Join as a Student'),
                  const AppLogo(),
                  SizedBox(
                    height: 77.h,
                  ),
                  SizedBox(
                    width: 323.w,
                    child: TextFormField(
                      controller: _otpTEController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(hintText: 'OTP'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter OTP';
                        }
                        if (value?.trim().length != 6) {
                          return 'OTP length is 6';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  PasswordTextField(
                    passwordTEController: _newPassTEController,
                    isObscure: true,
                    hintText: 'New Password',
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  PasswordTextField(
                    passwordTEController: _confirmPassTEController,
                    isObscure: true,
                    hintText: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  GetBuilder<StuVerifyOTPController>(
                    builder: (stuVerifyOTPController) {
                      if (stuVerifyOTPController.stuVerifyOTPInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return GetBuilder<StuSignUpController>(
                        builder: (stuSignUpController) {
                          return CustomisedElevatedButton(
                            onTap: () async {
                              verifyOTP(
                                  stuVerifyOTPController, stuSignUpController);
                            },
                            text: 'SIGN UP',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOTP(StuVerifyOTPController stuVerifyOTPController,
      StuSignUpController stuSignUpController) async {
    final result = await stuVerifyOTPController.stuVerifyOTP(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (result) {
      Get.snackbar('Successful!', stuVerifyOTPController.message);
      changePassword(stuSignUpController);
    } else {
      Get.snackbar('Failed!', stuVerifyOTPController.message,
          colorText: Colors.redAccent);
    }
  }

  Future<void> changePassword(StuSignUpController stuSignUpController) async {
    final result = await stuSignUpController.stuSignUp(
      widget.email,
      _otpTEController.text.trim(),
      _newPassTEController.text,
    );
    if (result) {
      Get.snackbar('Successful!', stuSignUpController.message);
      Get.to(
        () => const StuSignInScreen(),
      );
    } else {
      Get.snackbar('Failed!', stuSignUpController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
    _newPassTEController.dispose();
    _confirmPassTEController.dispose();
  }
}
