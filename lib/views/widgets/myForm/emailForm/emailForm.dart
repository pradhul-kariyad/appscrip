// ignore_for_file: file_names
import 'package:appscrip/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const EmailForm({
    super.key,
    this.validator,
    this.controller,
    // required Null Function(dynamic value) onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 40.h),
          child: Text(
            'Email',
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: TextFormField(
            validator: validator,
            // obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: textBorderColor)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: textBorderColor),
                  borderRadius: BorderRadius.circular(14)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: textBorderColor)),
              fillColor: textFieldColor,
              filled: true,
            ),
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
