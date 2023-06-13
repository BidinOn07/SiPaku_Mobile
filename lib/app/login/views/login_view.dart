import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:sipaku/app/models/user.dart';
import 'package:sipaku/app/register/views/register_view.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../urls/urls.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              controller: _usernameController,
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
              controller: _passwordController,
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
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text("Masuk"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterView());
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Buat body request dengan username dan password
    var requestBody = jsonEncode({
      'username': username,
      'password': password,
    });

    var response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/user'),
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // Periksa apakah login berhasil berdasarkan respon dari API
      if (jsonData['success'] == true) {
        // Redirect ke halaman Dashboard setelah login berhasil
        Get.to(() => DashboardScreen());
      } else {
        // Tampilkan pesan error jika login gagal
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Login Gagal"),
            content: Text(jsonData['message']),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Terjadi kesalahan saat melakukan login."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
