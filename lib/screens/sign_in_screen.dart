import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/widget/input_text.dart';
import '../widget/button.dart';
import '../widget/circle_avatar.dart';
import '../widget/line_under_button.dart';
import '../widget/wellcom_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    double space = MediaQuery.of(context).size.height / 20;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          CircleAvataar(
            width: 40,
            height: 40,
            radius: 40,
            color: Colors.brown,
            image: Image.asset('assets/images/user.png'),
          ),
          const WellcomMessage(
            title: 'Hello User!',
            body1: 'Create Your Account For',
            body2: 'Better Experience',
          ),
          InputText(
              hint: 'Enter Your Name',
              label: 'Name',
              icon: const Icon(Icons.person),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              hint: 'Enter Your User Name',
              label: 'User Name',
              icon: const Icon(Icons.person),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              hint: 'saul@user.com',
              label: 'Email',
              icon: const Icon(Icons.email),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              hint: 'Enter Your Number',
              label: 'Number',
              icon: const Icon(Icons.phone_in_talk_rounded),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              hint: 'Enter Your Password',
              label: 'Password',
              icon: x == 0
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              ontap: () {
                setState(() {
                  x == 0 ? x = 1 : x = 0;
                });
              }),
          SizedBox(
            height: space * 2,
          ),
          Button(
            lable: 'SIGNUP',
            ontap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          LineUnderButton(
            lable1: 'Already have an account?',
            lable2: ' Sign in',
            ontap: () {
              setState(() {
                Navigator.of(context).pushReplacementNamed('/');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LogInScreen()),
              });
            },
          ),
        ]),
      ),
    );
  }
}
