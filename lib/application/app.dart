import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/splash_screen.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';

import 'controller_binders.dart';

class MyCampus extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const MyCampus({super.key});

  @override
  MyCampusState createState() => MyCampusState();
}

class MyCampusState extends State<MyCampus> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 933),
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true,
        navigatorKey: MyCampus.globalKey,
        home: const SplashScreen(),
        initialBinding: GetXBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              backgroundColor: const Color(0xFFCBD0F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w),
              ),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            filled: true,
            fillColor: AppColors.primaryColor,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF505050),
                fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            disabledBorder: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
