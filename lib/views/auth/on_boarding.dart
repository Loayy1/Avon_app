import 'package:cosmetics_app/core/helper_methods.dart';
import 'package:flutter/material.dart';

import 'log_in.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage = 0;
  final list = [
    _collection(
      img: "assets/images/on_boarding1.png",
      title: "WELCOME!",
      supTitle:
          "Makeup has the power to transform your \nmood and empowers you to be a more \nconfident person.",
    ),
    _collection(
      img: "assets/images/on_boarding2.png",
      title: "SEARCH & PICK",
      supTitle:
          "We have dedicated set of products \nand routines hand picked for every skin type.",
    ),
    _collection(
      img: "assets/images/ring.png",
      title: "PUSH NOTIFICATIONS ",
      supTitle: "Allow notifications for new makeup & \ncosmetics offers.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () {
                  goTo(page: LogInView());
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 79),
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                list[currentPage].img,
                height: 259.6,
                width: 283.68,
              ),
            ),
            SizedBox(height: 28),
            Text(
              list[currentPage].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff434C6D),
              ),
            ),
            SizedBox(height: 10),
            Text(
              list[currentPage].supTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff434C6D),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            currentPage == list.length - 1
                ? SizedBox(
              height: 65,
                  width: 268,
                  child: FilledButton(
                      onPressed: () {
                        goTo(page: LogInView());
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xff434C6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      child: Text(
                        "let’s start!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                )
                : IconButton(
                    onPressed: () {
                      if (currentPage == list.length - 1) {
                        goTo(page: LogInView());
                      } else {
                        setState(() {
                          currentPage++;
                        });
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff434C6D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fixedSize: Size(50, 50),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _collection {
  String img, title, supTitle;

  _collection({required this.img, required this.title, required this.supTitle});
}
