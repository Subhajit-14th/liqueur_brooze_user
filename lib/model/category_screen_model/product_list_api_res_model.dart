class ProductListApiResModel {
  bool? success;
  String? message;
  List<Products>? products;

  ProductListApiResModel({this.success, this.message, this.products});

  ProductListApiResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? productName;
  String? category;
  String? subCategory;
  String? sku;
  String? variation;
  String? regulerPrice;
  String? discountPrice;
  String? stock;
  String? description;
  String? productImage;
  List<String>? galleryImages;

  Products(
      {this.sId,
      this.productName,
      this.category,
      this.subCategory,
      this.sku,
      this.variation,
      this.regulerPrice,
      this.discountPrice,
      this.stock,
      this.description,
      this.productImage,
      this.galleryImages});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['product_name'];
    category = json['category'];
    subCategory = json['sub_category'];
    sku = json['sku'];
    variation = json['variation'];
    regulerPrice = json['reguler_price'];
    discountPrice = json['discount_price'];
    stock = json['stock'];
    description = json['description'];
    productImage = json['productImage'];
    galleryImages = json['galleryImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['product_name'] = productName;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['sku'] = sku;
    data['variation'] = variation;
    data['reguler_price'] = regulerPrice;
    data['discount_price'] = discountPrice;
    data['stock'] = stock;
    data['description'] = description;
    data['productImage'] = productImage;
    data['galleryImages'] = galleryImages;
    return data;
  }
}
