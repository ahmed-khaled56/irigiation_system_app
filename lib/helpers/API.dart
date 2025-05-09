import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  Future<Map<String, dynamic>> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode}',
      );
    }
  }

  //   Future<Map<String, dynamic>> post({
  //     required String url,
  //     @required dynamic? body,
  //     @required String? token,
  //   }) async {
  //     Map<String, String> headers = {};
  //     headers.addAll({
  //       "Content-Type": 'application/json',
  //       "Accept": "application/json",
  //     });
  //     if (token != null) {
  //       headers.addAll({"Authorization": "Bearer $token"});
  //     }

  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       body: jsonEncode(body),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       try {
  //         final Map<String, dynamic> json = jsonDecode(response.body);
  //         return json;
  //       } catch (e) {
  //         throw Exception('Response was not valid JSON: ${response.body}');
  //       }
  //     } else {
  //       final Map<String, dynamic> json = jsonDecode(response.body);
  //       return json;
  //       // لا تفك body هنا إطلاقًا
  //       // throw Exception(
  //       //   'API Error: Status ${response.statusCode}, Body: ${response.body}',
  //       // );
  //     }
  //   }
  // }
  Future<Map<String, dynamic>> post({
    required String url,
    @required dynamic? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      "Content-Type": 'application/json',
      "Accept": "application/json",
    };

    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    dynamic jsonBody;
    try {
      jsonBody = jsonDecode(response.body);
    } catch (e) {
      throw Exception('Response was not valid JSON: ${response.body}');
    }

    if (jsonBody is! Map<String, dynamic>) {
      throw Exception(
        'Expected Map<String, dynamic>, got ${jsonBody.runtimeType}',
      );
    }

    if (response.statusCode == 200) {
      return jsonBody;
    } else {
      return jsonBody; // أو ارمي استثناء حسب المطلوب
    }
  }
}
