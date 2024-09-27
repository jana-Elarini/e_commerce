import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled19/data/model/Requests/LoginRequest.dart';
import 'package:untitled19/data/model/responses/CategoryOrBrandResponses.dart';

import 'package:untitled19/data/model/responses/LoginResponse.dart';
import 'package:untitled19/data/model/Requests/RegisterRequests.dart';
import 'package:untitled19/data/model/responses/RegisterResponse.dart';

import 'end_points.dart';

/*  https://ecommerce.routemisr.com/api/v1/auth/signup */
class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<RegisterResponse> register(String email, String name,
      String phone, String password, String rePassword) async {
    Uri url = Uri.https(baseUrl, Endpoints.signUp);
    var registerRequest = RegisterRequests(
      name: name,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RegisterResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<LoginResponse> Login(String email, String password) async {
    Uri url = Uri.https(baseUrl, Endpoints.login);
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponses> getAllCategories() async {
    Uri url = Uri.http(baseUrl, Endpoints.getAllCategories);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponses.fromJson(
          json); // Return the created instance
    } catch (e) {
      throw e; // Re-throw the caught exception
    }
  }

  static Future<CategoryOrBrandResponses> getAllBrands() async {
    Uri url = Uri.http(baseUrl, Endpoints.getAllBrands);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponses.fromJson(
          json); // Return the created instance
    } catch (e) {
      throw e; // Re-throw the caught exception
    }
  }
}
