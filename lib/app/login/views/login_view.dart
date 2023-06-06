import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipaku/app/sign_in/views/sign_in_view.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
  final _formKey = GlobalKey<FormState>();
}

class _LoginViewState extends State<LoginView> {
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
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Silahkan Masuk",
              style: TextStyle(fontSize: 30),
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
                    Get.to(() => DashboardScreen());
                  },
                  child: Center(
                      child: Text("Masuk",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
              ),
            ),
            Card(
              color: Colors.lightBlue,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Get.to(() => SignInView());
                  },
                  child: Center(
                      child: Text("Register",
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
