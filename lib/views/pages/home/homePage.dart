// ignore_for_file: file_names, unused_import, avoid_print
import 'dart:developer';
import 'package:appscrip/colors/colors.dart';
import 'package:appscrip/provider/user_data_provider/user_data_provider.dart';
import 'package:appscrip/views/widgets/homeWidgets/homeContainer/homeContainer.dart';
import 'package:appscrip/views/widgets/homeWidgets/homeDate/homeDate.dart';
import 'package:appscrip/views/widgets/myButton/myButton.dart';
import 'package:appscrip/views/widgets/searchForm/searchForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'App Scrip',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.sp,
                color: black,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              log('arrow_back');
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
              size: 27.sp,
            )),
        actions: [
          IconButton(
              onPressed: () {
                log('notifications_none_sharp');
              },
              icon: Icon(
                Icons.notifications_none_sharp,
                size: 25.sp,
                color: black,
              )),
          SizedBox(
            width: 2.w,
          )
        ],
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<UserDataProvider>(
          builder: (BuildContext context, userDataProvider, Widget? child) {
            return RefreshIndicator(
              color: blue,
              backgroundColor: white,
              onRefresh: () async {
                await userDataProvider.fetchUserList();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchForm(),
                  HomeDate(),
                  Divider(
                    color: textBorderColor,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 450.h,
                        width: MediaQuery.of(context).size.width,
                        child: HomeContainer(),
                      ),
                      Positioned(
                        left: 15.w,
                        bottom: 0.h,
                        child: MyButton(
                            onTap: () {
                              print('Add user');
                            },
                            name: 'Add User'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
