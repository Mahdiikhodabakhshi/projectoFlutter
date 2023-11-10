import 'package:flutter/material.dart';
import 'package:mahdi_khodabakhshi/src/pages/home_page.dart';
import 'package:mahdi_khodabakhshi/src/pages/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
/*        initialRoute: 'home',
        routes: <String, WidgetBuilder>{
          'home': (BuildContext context) => HomePage(),
          'user' :(BuildContext context) => UserPage() 
        });
        */

        home: HomePage(),
        );
  }
}
