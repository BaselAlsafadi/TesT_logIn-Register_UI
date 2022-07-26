import 'package:flutter/material.dart';

import '../widget/stars.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking ID',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '#123',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apartment Cleaning',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Date :  ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '26 Jan, 2022',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Time :  ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(
                            '04:00 PM',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/6.webp',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text('About Handyman',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Stack(children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/fmale2.jpg'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Justine Boyle',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: ClipPath(
                      clipper: StarClipper(10),
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        )),
      ),
    );
  }
}
