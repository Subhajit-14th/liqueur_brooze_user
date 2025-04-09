import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/model/home_screen_model/home_api_res_model.dart';
import 'package:liquor_brooze_user/services/services/depency_services.dart';
import 'package:http/http.dart' as http;

class HomeController {
  /// get home data
  Future<HomeApiResModel> getHomeData() async {
    debugPrint('Step 1');
    HomeApiResModel homeApiResModel = HomeApiResModel();
    try {
      debugPrint('Step 2');
      http.Response response = await http.get(
        Uri.parse('https://api.booze247.co.uk/api/home'),
      );
      debugPrint('Step 3');
      if (response.statusCode == 200) {
        debugPrint('Step 4');
        final jsonData = jsonDecode(response.body..toString());
        debugPrint("jsonData: ${jsonData.toString()}");
        homeApiResModel = HomeApiResModel.fromJson(jsonData);
      } else {
        debugPrint('Step 5');
        debugPrint(
            'API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('My home data api error: $e');
    }
    return homeApiResModel;
  }
}
