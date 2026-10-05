import 'package:cosmetics_app/core/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ProductData? details;
  // final list1 = [
  //   _Model(title: "Face tint / lip tint", img: "assets/images/top_item1.jpg"),
  //   _Model(title: "Athe Red lipstick", img: "assets/images/top_item2.jpg"),
  //   _Model(title: "Mascara for lashes", img: "assets/images/top_item3.jpg"),
  //   _Model(title: "Blemish cover", img: "assets/images/top_item4.jpg"),
  // ];
  // final list2 = [
  //   _Model(title: "IDYLL Perfume", img: "assets/images/most_order_img1.jpg"),
  //   _Model(title: "Hand Cream", img: "assets/images/most_order_img2.jpg"),
  //   _Model(title: "Pink Lipstick", img: "assets/images/most_order_img3.jpg"),
  //   _Model(title: "Cleansing Foam", img: "assets/images/most_order_img4.jpg"),
  // ];
  
  @override
  void initState() {
    super.initState();
    getData();
  }

  
  void getData()async{
    final resp=await DioHelper.getData("/api/Products");
    if(resp.isSuccess){
      setState(() {
        details=ProductData.fromJson({"data":resp.data});
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: details==null?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
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
                SizedBox(height: 13),
                Image.asset("assets/images/home_discount_img.png"),
                SizedBox(height: 26),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Top rated products",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: .7,
                  ),
                  itemBuilder: (context, index) => _Items(model: details!.list[index]),
                  itemCount: details!.list.length>4?4:details!.list.length,
                ),
                SizedBox(height: 42),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Most ordered Products",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: .7,
                  ),
                  itemBuilder: (context, index) => _Items(model: details!.list[index+4]),
                  itemCount: details!.list.length > 4
                      ? (details!.list.length - 4 > 4
                      ? 4
                      : details!.list.length - 4)
                      : 0,
                ),
                SizedBox(height: 77),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Items extends StatelessWidget {
  final ProductModel model;

  const _Items({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 176,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(4),
                ),
                child: Image.network(
                  model.imageUrl,
                  height: 169,
                  width: 161,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/cart.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            model.nameEn,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff434C6D),
            ),
          ),
          SizedBox(height: 3),
          Text(
            "${model.price.toString()} EGP",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff70839C),
            ),
          ),
        ],
      ),
    );
  }
}


class ProductData {
  late final List<ProductModel> list;

  ProductData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>ProductModel.fromJson(e)).toList();
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

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    nameEn = json['name_en']??"";
    nameAr = json['name_ar']??"";
    descriptionEn = json['description_en']??"";
    descriptionAr = json['description_ar']??"";
    price = json['price']??0;
    stock = json['stock']??0;
    imageUrl = json['image_url']??"";
    categoryId = json['category_id']??0;
  }

}