import 'package:flutter/material.dart';
import '../widget/login-signin-widget/button.dart';
import '../widget/divider.dart';
import '../widget/login-signin-widget/forgot_password_line.dart';
import '../widget/login-signin-widget/input_text.dart';
import '../widget/login-signin-widget/line_under_button.dart';
import '../widget/login-signin-widget/sign_in_with_google_or_phone.dart';
import '../widget/login-signin-widget/wellcom_message.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    double space = MediaQuery.of(context).size.height / 20;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          const WellcomMessage(
            title: 'Hello John',
            body1: 'WelCome Back , You Have Been ',
            body2: 'Missed For Long Time',
          ),
          InputText(
            hint: 'saaul@user.com',
            label: 'Email Address',
            icon: const Icon(Icons.email),
            ontap: () {},
          ),
          SizedBox(height: space / 2),
          InputText(
            hint: 'Enter Password',
            label: 'Password',
            icon: x == 0
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            ontap: () {
              setState(() {
                x == 0 ? x = 1 : x = 0;
              });
            },
          ),
          const ForgotPasswordLine(),
          SizedBox(height: space),
          Button(
            lable: 'LOGIN',
            ontap: () {
              Navigator.of(context).pushReplacementNamed('/homepagescreen');
            },
          ),
          const SizedBox(
            height: 5,
          ),
          LineUnderButton(
            lable1: 'Dont have an account?',
            lable2: ' Sign Up',
            ontap: () {
              setState(() {
                Navigator.of(context).pushReplacementNamed('/signinscreen');
              });
            },
          ),
          SizedBox(
            height: space * 2.5,
          ),
          const Dividers(),
          SizedBox(
            height: space / 2,
          ),
          const SigninWithGoogleOrPhone()
        ]),
      ),
    );
  }
}
