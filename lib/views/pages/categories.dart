import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final list = [
    _CategoriesModel(
      title: "Bundles",
      img: "assets/images/categories_img1.jpg",
    ),
    _CategoriesModel(
      title: "Perfumes",
      img: "assets/images/most_order_img1.jpg",
    ),
    _CategoriesModel(title: "Makeup", img: "assets/images/top_item2.jpg"),
    _CategoriesModel(
      title: "Skin Care",
      img: "assets/images/most_order_img4.jpg",
    ),
    _CategoriesModel(title: "Gifts", img: "assets/images/gifts.jpg"),
  ];

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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => _Items(model: list[index]),
              separatorBuilder: (context, index) => SizedBox(height: 0,),
              itemCount: list.length,
            ),
          ),SizedBox(height: 60,),
        ],
      ),
    );
  }
}

class _CategoriesModel {
  String title, img;

  _CategoriesModel({required this.title, required this.img});
}

class _Items extends StatelessWidget {
  final _CategoriesModel model;

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
            child: Image.asset(
              model.img,
              height: 69,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            model.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff434C6D),
            ),
          ),
          trailing: SvgPicture.asset("assets/icons/forward.svg"),
        ),
        SizedBox(height: 21),
        Divider(color: Color(0x80B3B3C1)),
      ],
    );
  }
}
