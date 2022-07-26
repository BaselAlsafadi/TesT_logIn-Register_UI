import 'package:flutter/material.dart';

import 'booking_history.dart';

class BottomSheeet extends StatelessWidget {
  const BottomSheeet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ID : #123',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: Divider(),
        ),
        BookingHistory(
          time: '1:17 PM',
          date: '6 Feb',
          title: 'New Booking',
          subtitle: 'New Booking Added By\nCustomer',
          colorcircel: Colors.red,
          colorline: Colors.red,
        ),
        BookingHistory(
          time: '1:12 PM',
          date: '6 Feb',
          title: 'Accept Booking',
          subtitle: 'Status Changed From\nPending To Accept',
          colorcircel: Colors.green,
          colorline: Colors.green,
        ),
        BookingHistory(
          time: '1:22 PM',
          date: '6 Feb',
          title: 'Assigned Booking',
          subtitle: 'Booking Has Assigned\nNaomie Hackett',
          colorcircel: Colors.orange,
          colorline: Colors.white,
        )
      ],
    );
  }
}
