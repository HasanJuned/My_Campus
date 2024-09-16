import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithTrailing extends StatelessWidget {
  const TextFieldWithTrailing({
    super.key,
    required TextEditingController emailTEController,
    required this.hintText,
  }) : _emailTEController = emailTEController;

  final TextEditingController _emailTEController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 323.w,
          child: TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              suffixIcon: Container(
                width: 110.w,
                height: 59.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      ScreenUtil().setWidth(0),
                    ),
                    topRight: Radius.circular(
                      ScreenUtil().setWidth(21),
                    ),
                    bottomLeft: Radius.circular(
                      ScreenUtil().setWidth(0),
                    ),
                    bottomRight: Radius.circular(
                      ScreenUtil().setWidth(21),
                    ),
                  ),
                  border: Border.all(
                    color: const Color(0x999B9B9B),
                  ),
                ),
                child: Center(
                  child: Text(
                    '@lus.ac.bd',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              hintText: hintText,
              errorStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
