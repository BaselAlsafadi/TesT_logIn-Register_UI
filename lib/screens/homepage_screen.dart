import 'package:flutter/material.dart';
import 'package:flutter_app/widget/tabs-widget/booking_tab.dart';
import 'package:flutter_app/widget/tabs-widget/users_tab.dart';
import 'package:hive_flutter/adapters.dart';
import '../widget/bottom_sheet.dart';
import '../widget/tabs-widget/homepage_tap.dart';

class HomePageScreen extends StatefulWidget {
  final String email;
  final String password;
  const HomePageScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> items = [];
  final usersBox = Hive.box('Users_box');

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Srevice List',
    ),
    Text(
      'Booking',
    ),
    Text(
      'Users',
    ),
    Text(
      'Notfication',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        : _refreshItems(); // Load data when app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
        actions: [
          _selectedIndex == 0
              ? const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.list,
                    size: 26,
                  ),
                )
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            barrierColor: Colors.grey[500]!.withOpacity(0.7),
                            context: context,
                            builder: (context) {
                              return const BottomSheeet();
                            });
                      },
                      child: const Text('Check Status')),
                ))
        ],
      ),
      body: Center(
          child: _selectedIndex == 0
              ? const TapHomeScreen()
              : _selectedIndex == 1
                  ? const BookingTab()
                  : UsersTab(
                      email: widget.email,
                    )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Colors.brown),
            label: '',
            icon: Icon(
              Icons.home,
              color: Color(0xff6C757D),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Icon(
              Icons.card_giftcard,
              color: Colors.brown,
            ),
            icon: Icon(
              Icons.card_giftcard,
              color: Color(0xff6C757D),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Icon(
              Icons.account_balance_wallet,
              color: Colors.brown,
            ),
            icon: Icon(Icons.account_balance_wallet, color: Color(0xff6C757D)),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.brown,
            ),
            icon: Icon(
              Icons.notifications,
              color: Color(0xff6C757D),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
    );
  }
}
