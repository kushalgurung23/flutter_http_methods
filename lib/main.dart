import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_http_methods/bindings/home_screen_binding.dart';
import 'package:second_http_methods/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http methods',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ),
      ),
      initialRoute: HomeScreen.id,
      getPages: [
        GetPage(
            name: HomeScreen.id,
            page: () => HomeScreen(),
            binding: HomeScreenBinding())
      ],
    );
  }
}
