import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_email_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_password_change_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

class FacRecoveryEmailScreen extends StatefulWidget {
  const FacRecoveryEmailScreen({super.key});

  @override
  State<FacRecoveryEmailScreen> createState() => _FacRecoveryEmailScreenState();
}

class _FacRecoveryEmailScreenState extends State<FacRecoveryEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                const TitleAndSubtitle(
                    title: 'RECOVERY',
                    subtitle: 'A code will be send to your email'),
                const AppLogo(),
                SizedBox(
                  height: 76.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      if (value!.isEmail == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GetBuilder<FacVerifyEmailController>(
                  builder: (facVerifyEmailController) {
                    if (facVerifyEmailController.facVerifyEmailProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          facVerifyEmail(facVerifyEmailController);
                        }
                      },
                      text: 'SUBMIT',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> facVerifyEmail(
      FacVerifyEmailController facVerifyEmailController) async {
    final result = await facVerifyEmailController.facVerifyEmail(
      _emailTEController.text.trim(),
      /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/
    );
    if (result) {
      Get.snackbar('Successful!', facVerifyEmailController.message);
      Get.to(
        () => FacPasswordChangeScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      Get.snackbar('Failed!', facVerifyEmailController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
