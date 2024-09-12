import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_availability_checking_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/customised_text_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';

import 'fac_sign_in_screen.dart';

class FacAvailabilityCheckScreen extends StatefulWidget {
  const FacAvailabilityCheckScreen({super.key});

  @override
  State<FacAvailabilityCheckScreen> createState() =>
      _FacAvailabilityCheckScreenState();
}

class _FacAvailabilityCheckScreenState
    extends State<FacAvailabilityCheckScreen> {
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
                  subtitle: 'Join as a Faculty',
                ),
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
                  height: 47.h,
                ),
                GetBuilder<FacAvailabilityCheckingController>(
                  builder: (facAvailabilityCheckingController) {
                    if (facAvailabilityCheckingController
                        .facAvailabilityCheckingProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          facAvailabilityCheck(
                              facAvailabilityCheckingController);
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
                      () => const FacSignInScreen(),
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

  Future<void> facAvailabilityCheck(
      FacAvailabilityCheckingController
          facAvailabilityCheckingController) async {
    final result = await facAvailabilityCheckingController.facAvailabilityCheck(
      _emailTEController.text.trim(),
      /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/
    );
    if (result) {
      Get.snackbar('Successful!', facAvailabilityCheckingController.message);
      Get.to(
        () => FacSignUpScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      _emailTEController.clear();
      Get.snackbar('Failed!', facAvailabilityCheckingController.message,
          colorText: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
