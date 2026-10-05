import 'package:cosmetics_app/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkout.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final list = [
    _CartModel(
      title: "Note Cosmetics",
      img: "assets/images/cart_img1.png",
      supTitle: "Ultra rich mascara for lashes",
      price: "350 EGP",
      count: 1
    ),
    _CartModel(
      title: "ARTDECO",
      img: "assets/images/cart_img2.png",
      supTitle: 'Bronzer - 02 ',
      price: "490 EGP",
      count: 2
    ),
    _CartModel(
      title: "Fendi",
      img: "assets/images/cart_img3.jpg",
      supTitle: "Lipstick - shade 9",
      price: "260 EGP",
      count: 1
    ),
    _CartModel(
      title: "Channel ",
      img: "assets/images/cart_img4.jpg",
      supTitle: "L’eau de perfum N5",
      price: "15.000 EGP",
      count: 1
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xffD9D9D9),
        surfaceTintColor: Colors.transparent,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff434C6D),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              goTo(page: CheckoutView());
            },
            icon: SvgPicture.asset(
              "assets/icons/shopping_cart_checkout_icon.svg",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "You have 4 products in your cart",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0x8C434C6D),
                  ),
                ),
              ),
              SizedBox(height: 34),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>_Items(model: list[index]) ,
                separatorBuilder:  (context, index) => Divider(color: Color(0x80B3B3C1)),
                itemCount: list.length,
              ),SizedBox(height: 25,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color:  Color(0xffDDF3EF),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- REVIEW PAYMENT",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff526273),
                        letterSpacing: 0.5,
                      ),
                    ),

                     SizedBox(height: 20),
                     Text(
                      "PAYMENT SUMMARY",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff526273),
                        letterSpacing: 1,
                      ),
                    ),

                     SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                        Text(
                          "16.100 EGP",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                      ],
                    ),

                     SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "SHIPPING FEES",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                        Text(
                          "TO BE CALCULATED",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                      ],
                    ),

                     SizedBox(height: 32),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0x1C29D3DA),
                    ),

                     SizedBox(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          "TOTAL + VAT",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                        Text(
                          "16.100 EGP",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff526273),
                          ),
                        ),
                      ],
                    ),

                     SizedBox(height: 38),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            goTo(page: CheckoutView());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Color(0xffD75D72),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_checkout,
                                size: 25,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "PROCEED CHECKOUT",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),SizedBox(height: 70,),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartModel {
  String title, supTitle, price, img;
  int count;

  _CartModel({
    required this.title,
    required this.img,
    required this.supTitle,
    required this.price,
    required this.count,
  });
}

class _Items extends StatefulWidget {
  final _CartModel model;
  const _Items({super.key, required this.model});

  @override
  State<_Items> createState() => _ItemsState();
}

class _ItemsState extends State<_Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 107,
                    height: 107,
                    child: Image.asset(
                      widget.model.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: -6,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/delete.svg",fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B4569),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.model.supTitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xBA3B4569),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.model.price,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B4569),
                    ),
                  ),

                   Padding(
                     padding: const EdgeInsets.only(left: 90),
                      child: Container(
                        height: 42,
                        width: 142,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff8E8EA9)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed:widget.model.count==1?null: () {
                                setState(() {
                                  widget.model.count--;
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                            SizedBox(width: 7),
                            Text("${widget.model.count}"),
                            SizedBox(width: 7),
                            IconButton(onPressed: () {
                              setState(() {
                                widget.model.count++;
                              });
                            }, icon: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 14),

      ],
    );
  }
}
