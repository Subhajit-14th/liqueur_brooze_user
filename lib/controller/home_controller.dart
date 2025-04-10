import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_api_res_model.dart';
import 'package:http/http.dart' as http;

class HomeController {
  /// get home data
  Future<HomeApiResModel> getHomeData() async {
    HomeApiResModel homeApiResModel = HomeApiResModel();
    try {
      http.Response response = await http.get(
        Uri.parse('https://api.booze247.co.uk/api/home'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body..toString());
        debugPrint("jsonData: ${jsonData.toString()}");
        homeApiResModel = HomeApiResModel.fromJson(jsonData);
      } else {
        debugPrint(
            'API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('My home data api error: $e');
    }
    return homeApiResModel;
  }
}
