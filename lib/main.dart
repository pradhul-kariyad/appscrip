// ignore_for_file: unused_import
import 'package:appscrip/provider/homeDateProvider/homeDateProvider.dart';
import 'package:appscrip/provider/homeRowProvider/homeRowProvider.dart';
import 'package:appscrip/provider/userDataProvider/userDataProvider.dart';
import 'package:appscrip/views/pages/home/homePage.dart';
import 'package:appscrip/views/pages/logIn/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userId = prefs.getBool('userId') ?? false;
  runApp(MyApp(
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  final bool userId;
  const MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return HomeRowProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return UserDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return HomeDateProvider();
        }),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Machine-Test',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: userId ? HomePage() : LogIn(),
      ),
    );
  }
}
