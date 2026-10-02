import 'package:cosmetics_app/views/pages/cart/cart.dart';
import 'package:cosmetics_app/views/pages/categories.dart';
import 'package:cosmetics_app/views/pages/home.dart';
import 'package:cosmetics_app/views/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final page = [HomeView(), CategoriesView(), CartView(), ProfileView()];
  final icons = [
    "assets/icons/home.svg",
    "assets/icons/categories.svg",
    "assets/icons/my_cart.svg",
    "assets/icons/profile.svg",
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentPage],
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(13),
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xffD9D9D9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .1),
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              page.length,
              (index) => IconButton(
                onPressed: () {
                  setState(() {
                    currentPage=index;
                  });
                },
                icon: SvgPicture.asset(
                  icons[index],
                  colorFilter: ColorFilter.mode(
                    currentPage == index
                        ? Color(0xffD75D72)
                        : Color(0xff8E8EA9),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}