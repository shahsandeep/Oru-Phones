import 'package:oru_phones/models/filter_model.dart';
import 'package:oru_phones/models/products_model.dart';
import 'package:oru_phones/models/search_model.dart';

class ApiResponse {
  ProductModel? productModel;
  FilterModel? filterModel;
  SearchModel? searchModel;
  bool? isOk;
  String? erroMsg;
  ApiResponse({
    this.productModel,
    this.erroMsg,
    this.isOk,
    this.filterModel,
    this.searchModel,
  });
}
