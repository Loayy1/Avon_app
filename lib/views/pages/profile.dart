import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final list = [
    _ProfileModel(title: "Edit Info", img: "assets/icons/edit_info.svg"),
    _ProfileModel(
      title: "Order History",
      img: "assets/icons/order_history.svg",
    ),
    _ProfileModel(title: "Wallet", img: "assets/icons/wallet.svg"),
    _ProfileModel(title: "Settings", img: "assets/icons/settings.svg"),
    _ProfileModel(title: "Voucher ", img: "assets/icons/voucher .svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 152,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff434C6D).withValues(alpha: .6),
                      Color(0xffECA4C5),
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
              ),
              Center(
                child: Transform.translate(
                  offset: Offset(0, 105),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/person.jpg",
                      height: 96,
                      width: 96,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 63),
          Text(
            "Sara Samer Talaat",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff434C6D),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => _Item(model: list[index]),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: list.length,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.red.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/logout.svg",
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffCD0F0F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileModel {
  String title, img;

  _ProfileModel({required this.title, required this.img});
}

class _Item extends StatelessWidget {
  final _ProfileModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13).copyWith(bottom: 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(model.img, height: 18, width: 18),
              SizedBox(width: 8),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                "assets/icons/forward.svg",
                fit: BoxFit.scaleDown,
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
