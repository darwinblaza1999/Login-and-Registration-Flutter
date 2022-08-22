import 'package:app/UI/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      //home: const MyHomePage(title: 'Finger Print'),
      home: const HomePage(),
    );
  }
}
