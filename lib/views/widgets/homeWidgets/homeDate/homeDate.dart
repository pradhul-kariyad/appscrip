// ignore_for_file: use_build_context_synchronously, file_names
import 'package:appscrip/colors/colors.dart';
import 'package:appscrip/provider/home_date_provider/home_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeDate extends StatelessWidget {
  const HomeDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sort by :',
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: 150.w,
              height: 34.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: textBorderColor),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<HomeDateProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.selectedText,
                          style: TextStyle(
                              color: myBlack,
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: blue,
              onPrimary: white,
              onSurface: black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      context.read<HomeDateProvider>().updateDate(formattedDate);
    }
  }
}
