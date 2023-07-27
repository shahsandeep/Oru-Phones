import 'package:flutter/material.dart';
import 'package:oru_phones/models/api_response_model.dart';
import 'package:oru_phones/services/api_services.dart';

class SearchViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isSuffix = false;
  bool get isSuffix => _isSuffix;
  TextEditingController textEditingController = TextEditingController();

  ApiResponse? _searchApiResponse;
  ApiResponse? get searchApiResponse => _searchApiResponse;

  setIsSuffix(bool set) {
    _isSuffix = set;
    notifyListeners();
  }

  setIsLoading(bool set) {
    _isLoading = set;
    notifyListeners();
  }

  Future getAndSetFilters() async {
    setIsLoading(true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (textEditingController.text.isNotEmpty &&
        textEditingController.text.length >= 2) {
      final response = await _apiServices.getSearch(textEditingController.text);
      _searchApiResponse = response;
    }

    setIsLoading(false);
    notifyListeners();
  }

  resetSearchModel() {
    _isLoading = false;
    _isSuffix = false;
    textEditingController.clear();
    _searchApiResponse = null;
  }
}
