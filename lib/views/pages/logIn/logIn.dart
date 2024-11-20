// ignore_for_file: file_names, unused_import, avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously
import 'package:appscrip/colors/colors.dart';
import 'package:appscrip/views/pages/home/homePage.dart';
import 'package:appscrip/views/widgets/myButton/myButton.dart';
import 'package:appscrip/views/widgets/myForm/emailForm/emailForm.dart';
import 'package:appscrip/views/widgets/myForm/passwordFom/passwordForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 168.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Hire-a-developer-1024x698.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 15.w),
                child: Text(
                  'Login Or Register To Book\nYour Appointments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 20.sp,
                  ),
                ),
              ),
              EmailForm(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              PasswordForm(
                controller: _passwordController,
                validator: (value) {
                  return value!.length < 6
                      ? 'Must be at least 6 characters'
                      : null;
                },
              ),
              SizedBox(
                height: 70.h,
              ),
              MyButton(
                name: 'Login',
                onTap: _login,
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By creating or logging into an account you are agreeing',
                    style: TextStyle(
                      color: black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'with our',
                    style: TextStyle(
                      color: black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: blue,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'and',
                    style: TextStyle(
                      color: black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Privacy Policy.',
                    style: TextStyle(
                      color: blue,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      if (email == 'appscrip@gmail.com' && password == 'Appscrip09') {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setBool('userId', true);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: blue,
            content: Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              ),
            ),
          ),
        );
        print('Login successful');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: blue,
            content: Center(
              child: Text(
                "Invalid email or password",
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              ),
            ),
          ),
        );
        print('Login failed');
      }
    }
  }
}
