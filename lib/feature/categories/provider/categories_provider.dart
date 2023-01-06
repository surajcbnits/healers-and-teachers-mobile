import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/categories/model/categories_model.dart';

import '../../../helper/api_helper.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoriesDataModel> _categoryList = [];
  List<CategoriesDataModel> get categoryListD => _categoryList;

  /// Fetches the list of [CategoriesDataModel] from the API
  Future<CategoriesDataModel> _getCategories(int id) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getCategoryDetailsById",
        query: {"id": id},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        CategoriesDataModel data = CategoriesDataModel.fromJson(response.data);
        return data;
      }
      return CategoriesDataModel();
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the list of [CategoriesDataModel] from the API
  Future<List<CategoriesDataModel>> _getCategoryList() async {
    try {
      List<CategoriesDataModel> categoriesDataModel = [];
      final response = await ApiHelper.getData(
        url: "/getAllCategoryList",
        // query: {"id": id},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        response.data.forEach((v) {
          categoriesDataModel.add(CategoriesDataModel.fromJson(v));
        });
      }
      return categoriesDataModel;
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the of [CategoriesDataModel] from the API
  Future<CategoriesDataModel> fetchCategoryById(int id) async {
    try {
      final data = await _getCategories(id);
      notifyListeners();
      return data;
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the of [List<CategoriesDataModel>] from the API
  Future<List<CategoriesDataModel>> fetchAllCategoryList() async {
    try {
      final data = await _getCategoryList();
      _categoryList = data;
      notifyListeners();
      return data;
    } catch (error) {
      throw (error);
    }
  }
}
