import 'dart:async';
import 'package:get/get.dart';

class RoutineTimeController extends GetxController {
  var currentClassTime = ''.obs;

  void startUpdating() {
    updateClassTime();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateClassTime();
    });
  }

  void updateClassTime() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;
    if ((currentHour == 0 && currentMinute >= 00) ||
        (currentHour == 8 && currentMinute < 55)) {
      currentClassTime.value = 'Classes will start as per your schedule';
    } else if ((currentHour == 8 && currentMinute >= 55) ||
        (currentHour == 9 && currentMinute < 45)) {
      currentClassTime.value = '8:55 AM - 9:45 AM';
    } else if ((currentHour == 9 && currentMinute >= 45) ||
        (currentHour == 10 && currentMinute < 40)) {
      currentClassTime.value = '9:50 AM - 10:40 AM';
    } else if ((currentHour == 10 && currentMinute >= 40) ||
        (currentHour == 11 && currentMinute < 35)) {
      currentClassTime.value = '10:45 AM - 11:35 AM';
    } else if ((currentHour == 11 && currentMinute >= 35) ||
        (currentHour == 12 && currentMinute < 30)) {
      currentClassTime.value = '11:40 AM - 12:30 PM';
    } else if ((currentHour == 12 && currentMinute >= 30) ||
        (currentHour == 13 && currentMinute < 25)) {
      currentClassTime.value = '12:35 PM - 1:25 PM';
    } else if ((currentHour == 13 && currentMinute >= 25) ||
        (currentHour == 14 && currentMinute < 10)) {
      currentClassTime.value = '1:30 PM - 2:10 PM';
    } else if ((currentHour == 14 && currentMinute >= 10) ||
        (currentHour == 15 && currentMinute < 15)) {
      currentClassTime.value = '2:15 PM - 3:05 PM';
    } else if ((currentHour == 15 && currentMinute >= 15) ||
        (currentHour == 16 && currentMinute < 00)) {
      currentClassTime.value = '3:10 PM - 4:00 PM';
    } else if ((currentHour == 16 && currentMinute >= 00) ||
        (currentHour == 16 && currentMinute < 55)) {
      currentClassTime.value = '4:00 AM - 4:55 AM';
    } else if ((currentHour == 19 && currentMinute >= 00) ||
        (currentHour == 19 && currentMinute < 50)) {
      currentClassTime.value = '7:00 PM - 7:50 PM';
    } else if ((currentHour == 19 && currentMinute >= 50) ||
        (currentHour == 20 && currentMinute < 50)) {
      currentClassTime.value = '8:00 PM - 8:50 PM';
    } else {
      currentClassTime.value = "Class is End";
    }
  }
}
