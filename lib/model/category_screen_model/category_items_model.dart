class CategoryItemsModel {
  String id;
  String itemImageUrl;
  String itemName;
  String regulerPrice;
  String discountPrice;
  String itemDescription;
  int itemQuantity;

  CategoryItemsModel({
    required this.id,
    required this.itemImageUrl,
    required this.itemName,
    required this.regulerPrice,
    required this.discountPrice,
    required this.itemDescription,
    required this.itemQuantity,
  });
}
