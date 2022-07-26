import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  final String time;
  final String date;
  final String title;
  final String subtitle;
  final Color colorline;
  final Color colorcircel;

  const BookingHistory({
    Key? key,
    required this.time,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.colorline,
    required this.colorcircel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: colorcircel,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: RotatedBox(
                          quarterTurns: 5,
                          child: Text(
                            '-----------',
                            style: TextStyle(
                                color: colorline, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
