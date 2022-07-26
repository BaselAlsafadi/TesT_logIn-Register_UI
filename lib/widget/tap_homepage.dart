import 'package:flutter/material.dart';
import 'package:flutter_app/widget/search_container.dart';
import 'package:flutter_app/widget/single_star.dart';

class TapHomeScreen extends StatefulWidget {
  const TapHomeScreen({Key? key}) : super(key: key);

  @override
  State<TapHomeScreen> createState() => _TapHomeScreenState();
}

class _TapHomeScreenState extends State<TapHomeScreen> {
  List image = [
    'assets/images/1.webp',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.webp'
  ];
  List title = [
    'Painting For\nBeautiful Homse...',
    'Painting For \nBeautiful Homse...',
    'Electronic Devices \nAnd Repaie... ',
    'Salon At Home \nwith Extra...',
    'Home Cleaning \nAnd Disinfection...',
    'Fixing TV Wire \nAnd Install...'
  ];

  List name = [
    'Emma Grate',
    'Penny Black',
    'Manuel Labor',
    'Lee Nonmi',
    'Abby Normal',
    'Annie Versaree'
  ];
  List profile = [
    'assets/images/fmale1.jfif',
    'assets/images/fmale2.jpg',
    'assets/images/fmale3.jpg',
    'assets/images/male4.webp',
    'assets/images/male5.jpg',
    'assets/images/fmale6.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            SearchContainer(),
            GridView.count(
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  return Stack(children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        alignment: Alignment.topCenter,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.asset(
                              image[index].toString(),
                              width: MediaQuery.of(context).size.width / 2,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: const Text(
                                    'PAINTING',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff6062B7),
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ])),
                    Positioned(
                        top: 85,
                        right: 10,
                        child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color(0xff6062B7),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              '\$150'.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Positioned(
                      left: 10,
                      top: 118,
                      child: Row(
                        children: [
                          SingleStar(),
                          SingleStar(),
                          SingleStar(),
                          SingleStar(),
                          SingleStar(),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '4.3',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 150,
                        left: 10,
                        child: Text(
                          title[index].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 10,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(profile[index].toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                name[index].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ))
                  ]);
                })),
          ]),
        ));
  }
}
