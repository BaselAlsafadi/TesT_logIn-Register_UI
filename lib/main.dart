import 'package:flutter/material.dart';
import 'package:flutter_app/routs/app_routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.brown),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
