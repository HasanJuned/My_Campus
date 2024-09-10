import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_availability_checking_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_availability_checking_screen.dart';
import '../widgets/app_logo.dart';
import '../widgets/customised_elevated_button.dart';
import '../widgets/screen_background.dart';

class StuFacChoiceScreen extends StatefulWidget {
  const StuFacChoiceScreen({super.key});

  @override
  State<StuFacChoiceScreen> createState() => _StuFacChoiceScreenState();
}

class _StuFacChoiceScreenState extends State<StuFacChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 263.h,
              ),
              const AppLogo(),
              SizedBox(
                height: 68.h,
              ),
              CustomisedElevatedButton(
                  onTap: () {
                    Get.to(
                      () => const FacAvailabilityCheckScreen(),
                    );
                  },
                  text: 'FACULTY MEMBER'),
              SizedBox(
                height: 50.h,
              ),
              CustomisedElevatedButton(
                  onTap: () {
                    Get.to(
                      () => const StuAvailabilityCheckScreen(),
                    );
                  },
                  text: 'STUDENT'),
            ],
          ),
        ),
      ),
    );
  }
}
