
class CategoriesData {
  late final List<CategoryModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['data'] ?? [],
    ).map((e) => CategoryModel.fromJson(e)).toList();
  }
}

class CategoryModel {
  late final int id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    titleEn = json['title_en'] ?? "";
    titleAr = json['title_ar'] ?? "";
    imageUrl = json['image_url'] ?? "";
  }
}
