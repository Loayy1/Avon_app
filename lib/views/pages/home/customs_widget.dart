import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model.dart';

class Items extends StatelessWidget {
  final ProductModel model;

  const Items({super.key, required this.model});

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
