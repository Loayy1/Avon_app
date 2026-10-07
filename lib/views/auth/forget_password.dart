import 'package:cosmetics_app/core/logic/dio_helper.dart';
import 'package:cosmetics_app/core/logic/helper_methods.dart';
import 'package:cosmetics_app/views/auth/sign_in.dart';
import 'package:cosmetics_app/views/auth/verify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'log_in.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  String? phoneCode;
  final phoneController = TextEditingController();
  
  void forgetPassword() async{
    final resp=await DioHelper.sendData("/api/Auth/forgot-password",data: {
      "countryCode": phoneCode,
      "phoneNumber": phoneController.text
    });
    print("Data: ${resp.data}");
    goTo(
      page: VerifyView(
        fromSignIn: false,
        phone: phoneController.text,
        phoneCode: phoneCode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: SafeArea(
              child: Form(
                onChanged: () {
                  setState(() {});
                },
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: IconButton(
                        onPressed: () {
                          goTo(page: LogInView());
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Color(0xff101010),
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Color(0x0D101010),
                          fixedSize: Size(22, 22),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Image.asset("assets/images/logo.png", height: 62, width: 67),
                    SizedBox(height: 40),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Please enter your phone number below \nto recovery your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                    SizedBox(height: 45),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x665A6690)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                            value: phoneCode,
                            hint:  Text("code"),
                            padding: EdgeInsets.symmetric(horizontal: 19),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff434C6D),
                            ),
                            items: [
                              DropdownMenuItem(value: "+20", child: Text("+20")),
                              DropdownMenuItem(value: "+212", child: Text("+212")),
                            ],
                            onChanged: (value) {
                              phoneCode = value!;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(8),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xff767676),
                              size: 17,
                            ),
                            underline: SizedBox(),
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xff434C6D),
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E8EA9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 56),
                    TextButton(
                      onPressed: phoneController.text.isEmpty
                          ? null
                          : () {
                              forgetPassword();
                            },
                      style: TextButton.styleFrom(
                        disabledBackgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 117,
                        ),
                        backgroundColor: Color(0xffD75D72),
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Next", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
