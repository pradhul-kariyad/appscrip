import 'package:appscrip/colors/colors.dart';
import 'package:appscrip/provider/userDataProvider/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (query) {
                Provider.of<UserDataProvider>(context, listen: false)
                    .filterUsers(query);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey,size: 20.sp,),
                hintText: 'Search for users',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                    borderSide: BorderSide(color: textBorderColor)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: textBorderColor),
                    borderRadius: BorderRadius.circular(8.sp)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                    borderSide: BorderSide(color: textBorderColor)),
                fillColor: textFieldColor,
                filled: true,
              ),
              style: TextStyle(
                  color: myBlack,
                  fontFamily: 'Poppins',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {},
            child: Container(
              width: 90.w,
              height: 39.h,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
