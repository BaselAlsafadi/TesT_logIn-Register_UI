import 'package:flutter/material.dart';
import '../database/database.dart';
import '../widget/login-signin-widget/button.dart';
import '../widget/login-signin-widget/circle_avatar.dart';
import '../widget/login-signin-widget/input_text.dart';
import '../widget/login-signin-widget/line_under_button.dart';
import '../widget/login-signin-widget/wellcom_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
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
              controller: nameController,
              hint: 'Enter Your Name',
              label: 'Name',
              icon: const Icon(Icons.person),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              controller: usernameController,
              hint: 'Enter Your User Name',
              label: 'User Name',
              icon: const Icon(Icons.person),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              controller: emailController,
              hint: 'saul@user.com',
              label: 'Email',
              icon: const Icon(Icons.email),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              controller: numberController,
              hint: 'Enter Your Number',
              label: 'Number',
              icon: const Icon(Icons.phone_in_talk_rounded),
              ontap: () {}),
          SizedBox(
            height: space / 2,
          ),
          InputText(
              controller: passwordController,
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
            ontap: () {
              setState(() {
                createItem({
                  "name": nameController.text,
                  "username": usernameController.text,
                  "email": emailController.text,
                  "password": passwordController.text,
                  "number": numberController.text,
                  "add": "false".toString(),
                  "delete": "false".toString(),
                  "edit": "false".toString()
                });
                refreshItems();
              });
              Navigator.of(context).pushReplacementNamed('/');
              print(items);
            },
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
              });
            },
          ),
        ]),
      ),
    );
  }
}
