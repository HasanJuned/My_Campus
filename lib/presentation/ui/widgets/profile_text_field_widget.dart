import 'package:flutter/material.dart';

class ProfileTextFieldWidget extends StatelessWidget {
  const ProfileTextFieldWidget({
    super.key,
    required this.width,
    required this.hintText,
    required this.controller,
  });

  final double width;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
