import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipaku/app/splash/views/splash_view.dart';

void main() async {
  // var urls = Urls();
  // var userList = await urls.getUser();
  // print(userList);

  runApp(const GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
