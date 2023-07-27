import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oru_phones/costants/constants.dart';
import 'package:oru_phones/models/api_response_model.dart';
import 'package:oru_phones/models/filter_model.dart';
import 'package:oru_phones/models/products_model.dart';
import 'package:oru_phones/models/search_model.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<ApiResponse> getProducts(int page) async {
    final String productUrl =
        '/global/assignment/getListings?page=$page&limit=10';

    try {
      final response = await _dio.get(baseUrl + productUrl);
      if (response.statusCode == 200) {
        final data = response.data;

        final ProductModel products =
            ProductModel.fromJson(data as Map<String, dynamic>);

        return ApiResponse(productModel: products, isOk: true);
      } else if (response.statusCode == 204) {
        return ApiResponse(
          erroMsg: 'All Data Fetched',
        );
      } else {
        return ApiResponse(
          erroMsg: response.data['message'],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse(erroMsg: e.toString());
    }
  }

  Future<ApiResponse> getFilters() async {
    const String filtertUrl = '/global/assignment/getFilters?isLimited=true';

    try {
      final response = await _dio.get(baseUrl + filtertUrl);
      if (response.statusCode == 200) {
        final data = response.data;

        final FilterModel filters =
            FilterModel.fromJson(data as Map<String, dynamic>);

        return ApiResponse(filterModel: filters, isOk: true);
      } else {
        return ApiResponse(
          erroMsg: response.data['message'],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse(erroMsg: e.toString());
    }
  }

  Future<ApiResponse> getSearch(String? searchText) async {
    var params = {"searchModel": "$searchText"};
    const String searchUrl = '/global/assignment/searchModel';

    try {
      final response = await _dio.post(
        baseUrl + searchUrl,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(params),
      );
      if (response.statusCode == 200) {
        final data = response.data;

        final SearchModel search =
            SearchModel.fromJson(data as Map<String, dynamic>);

        return ApiResponse(searchModel: search, isOk: true);
      } else {
        return ApiResponse(
          erroMsg: response.data['message'],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse(erroMsg: e.toString());
    }
  }
}
