import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_signin_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_recovery_email_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_screens/stu_main_bottom_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/customised_text_button.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

class StuSignInScreen extends StatefulWidget {
  const StuSignInScreen({super.key});

  @override
  State<StuSignInScreen> createState() => _StuSignInScreenState();
}

class _StuSignInScreenState extends State<StuSignInScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleAndSubtitle(title: 'SIGN IN', subtitle: 'Student'),
                const AppLogo(),
                SizedBox(
                  height: 76.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _idController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Student ID'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                PasswordTextField(
                  passwordTEController: _passTEController,
                  isObscure: true,
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 30.h,
                ),
                GetBuilder<StuSignInController>(
                  builder: (stuLoginController) {
                    if (stuLoginController.stuSignInInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        //Get.to(const StuHomeScreen());
                        if (_formKey.currentState!.validate()) {
                          stuSignIn(stuLoginController);
                        }
                      },
                      text: 'SIGN IN',
                    );
                  },
                ),
                SizedBox(
                  height: 34.h,
                ),
                CustomisedTextButton(
                    onTap: () {
                      Get.to(
                        () => const StuRecoveryEmailScreen(),
                      );
                    },
                    text: 'Forgot Password')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> stuSignIn(StuSignInController stuLoginController) async {
    final result = await stuLoginController.stuSignIn(
      _idController.text.trim(),
      _passTEController.text.trim(),
    );

    if (result) {
      Get.snackbar('Successful!', stuLoginController.message);
      Get.to(
        () => const StuMainBottomNavBarScreen(),
      );
    } else {
      Get.snackbar('Failed!', stuLoginController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passTEController.dispose();
    _idController.dispose();
  }
}
