import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> items = [];
  void _refreshItems() {
    final data = Hive.box('Users_box').keys.map((key) {
      final value = Hive.box('Users_box').get(key);
      return {
        "key": key,
        "name": value["name"],
        "username": value['username'],
        "email": value['email'],
        "password": value['password'],
        "number": value['number']
      };
    }).toList();

    setState(() {
      items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await Hive.box('Users_box').add(newItem);
    _refreshItems(); // update the UI
  }

  Future<void> deleteItem(int itemKey) async {
    await Hive.box('Users_box').delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  int x = 0;

  @override
  void initState() {
    super.initState();
    _refreshItems();

    items.length == 0
        ? createItem({
            "name": "Basel Alsafadi",
            "username": "Basel_123",
            "email": "Basel@gmail.com",
            "password": "123456",
            "number": "1"
          })
        : _refreshItems();
  }

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
            controller: emailController,
            hint: 'saaul@user.com',
            label: 'Email Address',
            icon: const Icon(Icons.email),
            ontap: () {},
          ),
          SizedBox(height: space / 2),
          InputText(
            controller: passwordController,
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
              for (int i = 0; i < items.length; i++) {
                items[i]["email"] == emailController.text &&
                        items[i]["password"] == passwordController.text
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePageScreen(
                            email: items[i]["email"],
                            password: items[i]["password"],
                          ),
                        ),
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Invalid Email Or Password')));
              }
              // items.contains('email') == emailController.text.toString() &&
              //         items.contains('password') ==
              //             passwordController.text.toString()
              //     ? Navigator.of(context)
              //         .pushReplacementNamed('/homepagescreen')
              //     : Navigator.of(context).pushReplacementNamed('/');
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
