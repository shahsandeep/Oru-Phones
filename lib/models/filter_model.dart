class FilterModel {
  Filters? filters;
  String? message;

  FilterModel({this.filters, this.message});

  FilterModel.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Filters {
  List<String>? make;
  List<String>? condition;
  List<String>? storage;
  List<String>? ram;

  Filters({this.make, this.condition, this.storage, this.ram});

  Filters.fromJson(Map<String, dynamic> json) {
    make = json['make'].cast<String>();
    condition = json['condition'].cast<String>();
    storage = json['storage'].cast<String>();
    ram = json['ram'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['make'] = make;
    data['condition'] = condition;
    data['storage'] = storage;
    data['ram'] = ram;
    return data;
  }
}
