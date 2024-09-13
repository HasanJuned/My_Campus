import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_password_change_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_otp_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

class FacPasswordChangeScreen extends StatefulWidget {
  const FacPasswordChangeScreen({super.key, required this.email});

  final String email;
  @override
  State<FacPasswordChangeScreen> createState() =>
      _FacPasswordChangeScreenState();
}

class _FacPasswordChangeScreenState extends State<FacPasswordChangeScreen> {
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TitleAndSubtitle(
                      title: 'CHANGE', subtitle: 'Set your password'),
                  const AppLogo(),
                  SizedBox(
                    height: 76.h,
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
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  PasswordTextField(
                    passwordTEController: _newPassTEController,
                    isObscure: true,
                    hintText: 'New Password',
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GetBuilder<FacVerifyOTPController>(
                    builder: (facVerifyOTPController) {
                      if (facVerifyOTPController.facVerifyOTPInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return GetBuilder<FacPasswordChangeController>(
                        builder: (facPasswordChangeController) {
                          return CustomisedElevatedButton(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  verifyOTP(facVerifyOTPController,
                                      facPasswordChangeController);
                                }
                              },
                              text: 'SUBMIT');
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

  Future<void> verifyOTP(FacVerifyOTPController facVerifyOTPController,
      FacPasswordChangeController facPasswordChangeController) async {
    final result = await facVerifyOTPController.facVerifyOTP(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (result) {
      Get.snackbar('Successful!', facVerifyOTPController.message);
      changePassword(facPasswordChangeController);
    } else {
      Get.snackbar('Failed!', facVerifyOTPController.message,
          colorText: Colors.redAccent);
    }
  }

  Future<void> changePassword(
      FacPasswordChangeController facPasswordChangeController) async {
    final result = await facPasswordChangeController.facPasswordChange(
      widget.email,
      _otpTEController.text.trim(),
      _newPassTEController.text,
    );
    if (result) {
      Get.snackbar('Successful!', facPasswordChangeController.message);
      Get.to(
        () => const FacSignInScreen(),
      );
    } else {
      Get.snackbar('Failed!', facPasswordChangeController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _newPassTEController.dispose();
    _otpTEController.dispose();
  }
}
