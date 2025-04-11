import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/model/category_screen_model/category_details_model.dart';
import 'package:liquor_brooze_user/model/category_screen_model/product_list_api_res_model.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  /// Get Product List API
  Future<ProductListApiResModel> getProductList(categoryId) async {
    ProductListApiResModel productListApiResModel = ProductListApiResModel();
    try {
      http.Response response = await http.get(
        Uri.parse('https://api.booze247.co.uk/api/productlist/$categoryId'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        debugPrint("jsonData: ${jsonData.toString()}");
        productListApiResModel = ProductListApiResModel.fromJson(jsonData);
      } else {
        debugPrint(
            'Product List API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('Product List Api Res Model: $e');
    }
    return productListApiResModel;
  }

  /// Get Product Details API
  Future<ProductDetailsApiResModel> getProductDetails(productId) async {
    ProductDetailsApiResModel productDetailsApiResModel =
        ProductDetailsApiResModel();
    try {
      http.Response response = await http.get(
        Uri.parse('https://api.booze247.co.uk/api//productdetails/$productId'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        debugPrint("jsonData: ${jsonData.toString()}");
        productDetailsApiResModel =
            ProductDetailsApiResModel.fromJson(jsonData);
      } else {
        debugPrint(
            'Product Details API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('Product Details Api Res Model: $e');
    }
    return productDetailsApiResModel;
  }
}
