import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  List<Map<String, dynamic>> items = [];
  final usersBox = Hive.box('Users_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
    items.length == 1
        ? createItem({
            "name": "Fahed Alghami",
            "username": "Fahed_123",
            "email": "Fahed@gmail.com",
            "password": "123456",
            "number": "2"
          })
        : _refreshItems(); // Load data when app starts // Load data when app starts
  }

  // Get all items from the database
  void _refreshItems() {
    final data = usersBox.keys.map((key) {
      final value = usersBox.get(key);
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

  // Create new item
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await usersBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> readItem(int key) {
    final item = usersBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
    await usersBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> deleteItem(int itemKey) async {
    await usersBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  // TextFields' controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          items.firstWhere((element) => element['key'] == itemKey);
      nameController.text = existingItem['name'];
      usernameController.text = existingItem['username'];
      emailController.text = existingItem['email'];
      passwordController.text = existingItem['password'];
      numberController.text = existingItem['number'];
    }
  }

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
                  "number": numberController.text
                });
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
