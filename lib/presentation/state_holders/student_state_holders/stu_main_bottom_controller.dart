import 'package:get/get.dart';

class StuMainBottomNavController extends GetxController {
  int currentSelectedScreen = 0;

  Future<void> changeScreen(int index) async {
    currentSelectedScreen = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
