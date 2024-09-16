import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_email_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_password_change_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/text_field_with_trailing.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

class StuRecoveryEmailScreen extends StatefulWidget {
  const StuRecoveryEmailScreen({super.key});

  @override
  State<StuRecoveryEmailScreen> createState() => _StuRecoveryEmailScreenState();
}

class _StuRecoveryEmailScreenState extends State<StuRecoveryEmailScreen> {
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
                TextFieldWithTrailing(
                  emailTEController: _emailTEController,
                  hintText: "Type your student email",
                ),
                SizedBox(
                  height: 40.h,
                ),
                GetBuilder<StuVerifyEmailController>(
                  builder: (stuVerifyEmailController) {
                    if (stuVerifyEmailController.stuVerifyEmailProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          stuVerifyEmail(stuVerifyEmailController);
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

  Future<void> stuVerifyEmail(
      StuVerifyEmailController stuVerifyEmailController) async {
    final result = await stuVerifyEmailController.stuVerifyEmail(
      _emailTEController.text.trim(),
      /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/
    );
    if (result) {
      Get.snackbar('Successful!', stuVerifyEmailController.message);
      Get.to(
        () => StuPasswordChangeScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      Get.snackbar('Failed!', stuVerifyEmailController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
