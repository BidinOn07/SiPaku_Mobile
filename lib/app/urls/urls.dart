import 'dart:convert';

import 'package:sipaku/app/models/gejala.dart';
import 'package:sipaku/app/models/penyakit.dart';
import 'package:sipaku/app/models/user.dart';
import 'package:http/http.dart' as http;
// import 'package:http/retry.dart';

class Urls {
  final String baseUrl = "http://127.0.0.1:8000/api";
  Future<List<User>> getUser() async {
    final response = await http
        .get(
          Uri.parse("$baseUrl/user"),
        )
        .timeout(Duration(seconds: 120));
    print("getProjek ${response.statusCode}");
    final data = jsonDecode(response.body);
    print(data);
    GetUserResponse record = GetUserResponse.fromJson(data);

    if (response.statusCode == 200) {
      return record.data;
    } else {
      return record.data;
    }
}
  Future<List<Gejala>> getGejala() async {
    final response = await http
        .get(
          Uri.parse("$baseUrl/gejala"),
        )
        .timeout(Duration(seconds: 120));
    print("getProjek ${response.statusCode}");
    final data = jsonDecode(response.body);
    print(data);
    GetGejalaResponse record = GetGejalaResponse.fromJson(data);

    if (response.statusCode == 200) {
      return record.data;
    } else {
      return record.data;
    }
  }

  Future<List<Penyakit>> getPenyakit() async {
    final response = await http
        .get(
          Uri.parse("$baseUrl/penyakit"),
        )
        .timeout(Duration(seconds: 120));
    print("getProjek ${response.statusCode}");
    final data = jsonDecode(response.body);
    print(data);
    GetPenyakitResponse record = GetPenyakitResponse.fromJson(data);

    if (response.statusCode == 200) {
      return record.data;
    } else {
      return record.data;
    }
  }
    
}
