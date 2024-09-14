import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  EmailOTP.config(
    appName: 'My Campus',
    otpType: OTPType.numeric,
    expiry: 60000,
    emailTheme: EmailTheme.v6,
    otpLength: 6,
  );

  runApp(
    const SafeArea(
      child: MyCampus(),
    ),
  );
}
