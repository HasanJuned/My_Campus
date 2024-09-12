import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_profile_details_controller.dart';
import 'package:my_campus/presentation/ui/widgets/profile_text_field_widget.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class FacProfileScreen extends StatefulWidget {
  const FacProfileScreen({super.key});

  @override
  State<FacProfileScreen> createState() => _FacProfileScreenState();
}

class _FacProfileScreenState extends State<FacProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _shortFormController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = AuthController.email0 ?? 'Unknown';
    _fullNameController.text = AuthController.fullName0 ?? 'Unknown';
    _designationController.text = AuthController.designation0 ?? 'Unknown';
    _departmentController.text = AuthController.department0 ?? 'Unknown';
    _shortFormController.text = AuthController.shortForm ?? 'Unknown';
    _passwordController.text = '123456';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScreenBackground(
          child: Center(
            child: SingleChildScrollView(
              child: _facProfileUi,
            ),
          ),
        ),
      ),
    );
  }

  Column get _facProfileUi {
    return Column(
      children: [
        const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            ProfileTextFieldWidget(
              controller: _emailController,
              width: double.infinity,
              hintText: 'Email',
            ),
            ProfileTextFieldWidget(
              controller: _fullNameController,
              width: double.infinity,
              hintText: 'Full Name',
            ),
            ProfileTextFieldWidget(
              controller: _designationController,
              width: double.infinity,
              hintText: 'Designation',
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment,
              children: [
                ProfileTextFieldWidget(
                  controller: _departmentController,
                  width: 190,
                  hintText: 'Department',
                ),
                const Spacer(),
                ProfileTextFieldWidget(
                  controller: _shortFormController,
                  width: 190,
                  hintText: 'Short-Form',
                ),
              ],
            ),
            ProfileTextFieldWidget(
              controller: _passwordController,
              width: double.infinity,
              hintText: 'Password',
            ),
          ],
        ),
        GetBuilder<FacProfileDetailsController>(
            builder: (facProfileDetailsController) {
          if (facProfileDetailsController.facProfileDetailsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await _updateProfile(facProfileDetailsController);
              },
              child: const Text('Update Profile'),
            ),
          );
        })
      ],
    );
  }

  Future<void> _updateProfile(
      FacProfileDetailsController facProfileDetailsController) async {
    final result = await facProfileDetailsController.facProfile(
      _emailController.text,
      _fullNameController.text,
      _designationController.text,
      _departmentController.text,
      _shortFormController.text,
      _passwordController.text,
    );

    if (result) {
      Get.snackbar('Success!', facProfileDetailsController.message,
          colorText: Colors.green);

      await AuthController.setProfileDetails(
          AuthController.accessToken.toString(),
          _emailController.text,
          _fullNameController.text,
          _designationController.text,
          _departmentController.text,
          _shortFormController.text,
          '1');
    } else {
      Get.snackbar('Failed!', facProfileDetailsController.message,
          colorText: Colors.redAccent);
    }
  }
}
