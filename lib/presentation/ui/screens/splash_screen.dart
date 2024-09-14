import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/ui/screens/stu_fac_choice_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_screens/stu_main_bottom_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_availability_checking_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_main_bottom_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthState();
  }

  void checkUserAuthState() async {
    /* final result = await AuthController.checkStudentLoginState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        if (result) {
          Get.offAll(
            () => const StuMainBottomNavBarScreen(),
          );
        } else {
          Get.offAll(
            () => const StuFacChoiceScreen(),
          );
        }
      },
    );*/

    final result = await AuthController.checkLoginState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        if (result) {
          Get.offAll(
            () => const FacMainBottomNavBarScreen(),
          );
        } else {
          Get.offAll(
            () => const StuFacChoiceScreen(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: AppLogo(),
            ),
            Spacer(),
            CircularProgressIndicator(
              color: Colors.teal,
            ),
            SizedBox(
              height: 8,
            ),
            Text('Version 1.0.0'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
