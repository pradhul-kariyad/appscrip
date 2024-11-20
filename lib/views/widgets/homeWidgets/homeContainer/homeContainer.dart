import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscrip/colors/colors.dart';
import 'package:appscrip/provider/userDataProvider/userDataProvider.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (BuildContext context, userDataProvider, Widget? child) {
        if (userDataProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeAlign: -4,
              color: blue,
            ),
          );
        }

        if (userDataProvider.filteredUserList.isEmpty) {
          return Center(
            child: Text(
              "No users found",
              style: TextStyle(
                color: blue,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: userDataProvider.filteredUserList.length,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemBuilder: (BuildContext context, int index) {
            final user = userDataProvider.filteredUserList[index];
            return Center(
              child: Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                height: 150.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, top: 15.h, bottom: 2.h),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}.',
                            style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            user.name ?? 'Unknown',
                            style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w, bottom: 7.h),
                      child: Text(
                        user.address?.street ?? 'No address available',
                        style: TextStyle(
                          color: blue,
                          fontFamily: 'Poppins',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w, bottom: 4.h),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: blue,
                              size: 18.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              user.email ?? 'Email not available',
                              style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.location_on_rounded,
                              color: blue,
                              size: 18.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              user.address?.city ?? 'City not available',
                              style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w, bottom: 4.h),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: blue,
                              size: 18.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              user.phone ?? 'Phone not available',
                              style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.web_stories_outlined,
                              color: blue,
                              size: 18.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              user.website ?? 'website not available',
                              style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: textBorderColor),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w, top: 3.h),
                      child: Row(
                        children: [
                          Text(
                            'View User Details',
                            style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18.sp,
                            color: blue,
                          ),
                          SizedBox(width: 16.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
