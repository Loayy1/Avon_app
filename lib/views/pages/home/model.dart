class ProductData {
  late final List<ProductModel> list;

  ProductData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['data'] ?? [],
    ).map((e) => ProductModel.fromJson(e)).toList();
  }
}

class ProductModel {
  late final int id;
  late final String nameEn;
  late final String nameAr;
  late final String descriptionEn;
  late final String descriptionAr;
  late final double? price;
  late final int stock;
  late final String imageUrl;
  late final int categoryId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nameEn = json['name_en'] ?? "";
    nameAr = json['name_ar'] ?? "";
    descriptionEn = json['description_en'] ?? "";
    descriptionAr = json['description_ar'] ?? "";
    price = json['price'] ?? 0.0;
    stock = json['stock'] ?? 0;
    imageUrl = json['image_url'] ?? "";
    categoryId = json['category_id'] ?? 0;
  }
}
