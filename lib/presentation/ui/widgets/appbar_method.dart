import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'app_logo.dart';

AppBar customisedAppBar(String appBarAuth, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.25.h,
    leading: IconButton(
      icon: const AppLogo(),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    title: Text(
      appBarAuth,
      style: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Logout",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900),
                ),
                content: Text(
                  "Are you sure you want to logout?",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "NO",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AuthController.facAuthClear();
                    },
                    child: Text(
                      "YES",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
      )
    ],
    centerTitle: true,
  );
}
/*AppBar customisedAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.25.h,
    leading: IconButton(
      icon: const AppLogo(),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    title: Text(
      AuthController.email0 ?? 'Failed to load email',
      style: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async{
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text(
          //         "Logout",
          //         style:
          //             TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900),
          //       ),
          //       content: Text(
          //         "Are you sure you want to logout?",
          //         style:
          //             TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Get.back();
          //           },
          //           child: Text(
          //             "NO",
          //             style: TextStyle(
          //                 fontSize: 18.sp,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.green),
          //           ),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             AuthController.clear();
          //           },
          //           child: Text(
          //             "YES",
          //             style: TextStyle(
          //                 fontSize: 18.sp,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.red),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // );
        },
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
      )
    ],
    centerTitle: true,
  );
}*/
