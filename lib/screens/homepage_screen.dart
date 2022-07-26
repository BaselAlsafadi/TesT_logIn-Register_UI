import 'package:flutter/material.dart';
import 'package:flutter_app/screens/details_service_screen.dart';
import '../widget/bottom_sheet.dart';
import '../widget/tap_homepage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

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
      'Wallet',
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
          child:
              _selectedIndex == 0 ? const TapHomeScreen() : const BookingTab()),
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
