/// contains all service to get data from Server
// class RestApiServices {
//   static final RestApiServices _restApiServices = RestApiServices._internal();

//   factory RestApiServices() {
//     return _restApiServices;
//   }
//   RestApiServices._internal();

// to get data from server, you can use Http for simple feature
// or Dio for more complex feature

// Example:
// Future<ProductDetail?> getProductDetail(int id)async{
//   var uri = Uri.parse(ApiPath.product + "/$id");
//   try {
//     return await Dio().getUri(uri);
//   } on DioError catch (e) {
//     print(e);
//   } catch (e) {
//     print(e);
//   }
// }
// }
library rest_api_services;

import '../../app/utils/ui/ui_utils.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

import '../../app/constans/app_constants.dart';
import '../models/user.dart';
// import '../models/model.dart';

//Part
part 'rest_api_services/auth_services.dart';
