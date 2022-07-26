import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen.dart';
import 'package:flutter_app/screens/sign_in_screen.dart';
import '../widget/button.dart';
import '../widget/divider.dart';
import '../widget/forgot_password_line.dart';
import '../widget/input_text.dart';
import '../widget/line_under_button.dart';
import '../widget/sign_in_with_google_or_phone.dart';
import '../widget/wellcom_message.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool value = false;
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePageScreen()),
              // );
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SignInScreen()),
                // );
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
