import 'package:cosmetics_app/core/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  CategoriesData? details;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final resp = await DioHelper.getData("/api/Categories");
    if (resp.isSuccess) {
      setState(() {
        details = CategoriesData.fromJson({"data": resp.data});
      });

    }
  }

  // late final list = [
  //   _CategoriesModel(
  //     title: details!.list[0].titleEn,
  //     img: details!.list[0].imageUrl,
  //   ),
  //   _CategoriesModel(
  //     title: details!.list[1].titleEn,
  //     img: "assets/images/most_order_img1.jpg",
  //   ),
  //   _CategoriesModel(title: "Makeup", img: "assets/images/top_item2.jpg"),
  //   _CategoriesModel(
  //     title: "Skin Care",
  //     img: "assets/images/most_order_img4.jpg",
  //   ),
  //   _CategoriesModel(title: "Gifts", img: "assets/images/gifts.jpg"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color(0xffD9D9D9),
        surfaceTintColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff434C6D),
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              cursorColor: Color(0xff434C6D),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8E8EA9),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xffB3B3C1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffB3B3C1)),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
      body: details ==null ? Center(child: CircularProgressIndicator()):Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  _Items(model: details!.list[index]),
              separatorBuilder: (context, index) => Divider(color: Color(0x80B3B3C1)),
              itemCount: details!.list.length,
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final CategoryModel model;

  const _Items({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              model.imageUrl,
              height: 69,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            model.titleEn,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff434C6D),
            ),
          ),
          trailing: SvgPicture.asset("assets/icons/forward.svg"),
        ),
        SizedBox(height: 21),

      ],
    );
  }
}

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
