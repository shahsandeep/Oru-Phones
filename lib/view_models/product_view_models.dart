import 'package:flutter/material.dart';
import 'package:oru_phones/models/api_response_model.dart';
import 'package:oru_phones/services/api_services.dart';

class ProductViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  bool _isLoading = false;
  bool _isLoadingMoreData = false;
  bool _isFilterLoading = false;
  bool get isFilterLoading => _isFilterLoading;
  bool get isLoadingMoreData => _isLoadingMoreData;

  bool get isLoading => _isLoading;
  int page = 1;
  ApiResponse? _apiResponse;
  ApiResponse? get apiResponse => _apiResponse;

  ApiResponse? _filterApiResponse;
  ApiResponse? get filterApiResponse => _filterApiResponse;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;
  bool isFirstTimeLoadingData = true;
  bool isAllDataFetched = false;

  setIsloadingMoreData(bool set) {
    _isLoadingMoreData = set;
    notifyListeners();
  }

  setIsFilterLoading(bool set) {
    _isFilterLoading = set;
    notifyListeners();
  }

  setLoading(bool set) {
    _isLoading = set;
    notifyListeners();
  }

  Future getAndSetProducts() async {
    if (isFirstTimeLoadingData) {
      setLoading(true);
      _apiResponse = null;
      isAllDataFetched = false;
      page = 1;
      final response = await _apiServices.getProducts(page);
      _apiResponse = response;
      isFirstTimeLoadingData = false;
      page++;
      setLoading(false);
      notifyListeners();
    } else {
      isFirstTimeLoadingData = false;
      setIsloadingMoreData(true);
      final response = await _apiServices.getProducts(page);
      if (response.erroMsg == 'All Data Fetched') {
        setIsloadingMoreData(false);

        isAllDataFetched = true;
        return;
      }
      _apiResponse?.productModel?.listings
          ?.addAll(response.productModel!.listings!.toList());
      page++;

      setIsloadingMoreData(false);
      notifyListeners();
    }
  }

  Future getAndSetFilters() async {
    setIsFilterLoading(true);

    final response = await _apiServices.getFilters();
    _filterApiResponse = response;

    setIsFilterLoading(false);
    notifyListeners();
  }

  ProductViewModel() {
    getAndSetProducts();
    scrollControllerFunction();
  }

  scrollControllerFunction() {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!isAllDataFetched) {
        getAndSetProducts();
      }
    }
  }
}
