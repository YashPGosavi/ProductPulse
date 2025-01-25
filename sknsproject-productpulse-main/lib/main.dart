import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodpulseversion3/screens/Home%20Screen/controller/home_controller.dart';
import 'package:prodpulseversion3/screens/Login%20Screen/controller/login_controller.dart';
import 'package:prodpulseversion3/screens/search/controller/search_controller.dart';
import 'package:prodpulseversion3/screens/search/search_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product pulse',
      home: const SearchPage(),
      // home: const HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            HomeController(),
          );
          Get.put(
            LoginController(),
          );
          Get.put(
            SearchWidgetController(),
          );
        },
      ),
    );
  }
}
