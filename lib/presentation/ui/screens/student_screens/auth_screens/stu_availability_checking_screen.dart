import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_availability_checking_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/customised_text_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/text_field_with_trailing.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

import 'stu_sign_in_screen.dart';

class StuAvailabilityCheckScreen extends StatefulWidget {
  const StuAvailabilityCheckScreen({super.key});

  @override
  State<StuAvailabilityCheckScreen> createState() =>
      _StuAvailabilityCheckScreenState();
}

class _StuAvailabilityCheckScreenState
    extends State<StuAvailabilityCheckScreen> {
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
                  title: 'WELCOME',
                  subtitle: 'Join as a Student',
                ),
                const AppLogo(),
                SizedBox(
                  height: 76.h,
                ),
                TextFieldWithTrailing(
                  emailTEController: _emailTEController,
                  hintText: "Type your student email",
                ),
                SizedBox(
                  height: 47.h,
                ),
                GetBuilder<StuAvailabilityCheckingController>(
                  builder: (stuAvailabilityCheckingController) {
                    if (stuAvailabilityCheckingController
                        .stuAvailabilityCheckingProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        final form = _formKey.currentState;
                        if (form != null && form.validate()) {
                          stuAvailabilityCheck(
                              stuAvailabilityCheckingController);
                        }
                      },
                      text: 'CHECK AVAILABILITY',
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomisedTextButton(
                  onTap: () {
                    Get.to(
                      () => const StuSignInScreen(),
                    );
                  },
                  text: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> stuAvailabilityCheck(
      StuAvailabilityCheckingController
          stuAvailabilityCheckingController) async {
    final result = await stuAvailabilityCheckingController.stuAvailabilityCheck(
      _emailTEController.text.trim(),
      /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/
    );
    if (result) {
      Get.snackbar('Successful!', stuAvailabilityCheckingController.message);
      Get.to(
        () => StuSignUpScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      Get.snackbar('Failed!', stuAvailabilityCheckingController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
