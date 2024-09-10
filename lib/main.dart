import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_campus/presentation/ui/widgets/sheet_connect_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  //await gSheetIntit();
  runApp(
    const SafeArea(
      child: MyCampus(),
    ),
  );
}

