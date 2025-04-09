class HomeApiResModel {
  bool? success;
  String? message;
  List<Data>? data;

  HomeApiResModel({this.success, this.message, this.data});

  HomeApiResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class Data {
  List<Categories>? categories;
  List<String>? banners;
  List<FeatureBrand>? featureBrand;

  Data({this.categories, this.banners, this.featureBrand});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }

    if (json['banners'] != null) {
      banners = List<String>.from(json['banners']);
    }

    if (json['featureBrand'] != null) {
      featureBrand = <FeatureBrand>[];
      json['featureBrand'].forEach((v) {
        featureBrand!.add(FeatureBrand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (categories != null) {
      json['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      json['banners'] = banners;
    }
    if (featureBrand != null) {
      json['featureBrand'] = featureBrand!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class Categories {
  String? sId;
  String? catagoryname;
  String? image;

  Categories({this.sId, this.catagoryname, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    catagoryname = json['catagoryname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = sId;
    json['catagoryname'] = catagoryname;
    json['image'] = image;
    return json;
  }
}

class FeatureBrand {
  int? id;
  String? image;
  String? name;

  FeatureBrand({this.id, this.image, this.name});

  FeatureBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['image'] = image;
    json['name'] = name;
    return json;
  }
}
