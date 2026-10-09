import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model.dart';

class Items extends StatelessWidget {
  final CategoryModel model;

  const Items({super.key, required this.model});

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
