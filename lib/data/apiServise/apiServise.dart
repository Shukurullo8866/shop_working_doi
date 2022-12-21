import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_working_doi/data/models/productModel.dart';

import '../models/carModel.dart';
import 'apiClients.dart';

class ApiService extends ApiClient {
  // Future<Products?> getSingleAlbumById() async {
  //   // Dio dio = Dio();
  //   try {
  //     Response response = await dio.get("${dio.options.baseUrl}/products");
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       return Products.fromJson(response.data);
  //     }
  //   } catch (err) {
  //     print(err.toString());
  //   }
  // }

  Future<List<Products>> getAllProducts() async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}/products");
      if (response.statusCode == 200) {
        return ((response.data)["data"] as List?)
            ?.map((e) => Products.fromJson(e))
            .toList() ??
            [];
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return [];
  }

  Future<List<CategoryModel>> getCategories() async {
    // Dio dio = Dio();
    try {
      Response response = await dio.get("${dio.options.baseUrl}/categories");
      if (response.statusCode == 200) {
        print(response.data);
        return (response.data as List?)
            ?.map((e) => CategoryModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (err) {
      print(err.toString());
    }
    return [];
  }
}
