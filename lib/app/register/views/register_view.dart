// ignore_for_file: unused_import, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipaku/app/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(9),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Center(
              child: Image.asset(
                'assets/images/logo_sipaku.png',
                height: 250,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Silahkan Daftar akun anda",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  size: 40,
                ),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.lightBlue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  size: 40,
                ),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.lightBlue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 40,
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.lightBlue),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.lightBlue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.lightBlue,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Get.to(() => LoginView());
                  },
                  child: Center(
                      child: Text("Buat Akun",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
