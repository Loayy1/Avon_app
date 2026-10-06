import 'package:cosmetics_app/core/logic/dio_helper.dart';
import 'package:cosmetics_app/core/logic/helper_methods.dart';
import 'package:cosmetics_app/views/auth/sign_in.dart';
import 'package:cosmetics_app/views/auth/verify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/home.dart';
import '../view.dart';
import 'forget_password.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool isObscure = true;
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  String? phoneCode;
  String? errorMsg;
  void logIn() async {
    final resp = await DioHelper.sendData(
      "/api/Auth/login",
      data: {
        "countryCode": "+20",
        "phoneNumber": phoneController.text,
        "password": passwordController.text,
      },
    );
    print("loay${resp.data}");
    if (resp.isSuccess) {
      goTo(page: ViewPage());
    }else{
      setState(() {
        errorMsg = "phone or password is wrong";
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SingleChildScrollView(
            child: Form(
              onChanged: () {
                setState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 48),
                  Image.asset(
                    "assets/images/login_img.png",
                    height: 227,
                    width: 284,
                  ),
                  SizedBox(height: 45),
                  Text(
                    "Login Now",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Please enter the details below to continue",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8E8EA9),
                    ),
                  ),
                  SizedBox(height: 41),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x665A6690)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton(
                          value: phoneCode,
                          hint: Text("code"),
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff434C6D),
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: "20",
                              child: Text("+20"),
                            ),
                            DropdownMenuItem<String>(
                              value: "212",
                              child: Text("+212"),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              phoneCode = value;
                              setState(() {});
                            }
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
                            errorText: errorMsg,
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8E8EA9),
                            ),errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isObscure,
                    cursorColor: Color(0xff434C6D),
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      errorText: errorMsg,
                      hintText: "Your Password",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          isObscure = !isObscure;
                          setState(() {});
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/visibility_${isObscure ? "off" : "on"}.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {
                        goTo(page: ForgetPasswordView(), keepHistory: true);
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color(
                          0xffD75D72,
                        ).withValues(alpha: .4),
                      ),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffD75D72),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 43),
                  FilledButton(
                    onPressed:
                        phoneController.text.isEmpty ||
                            passwordController.text.isEmpty
                        ? null
                        : () {
                            print("Phone: ${phoneController.text}");
                            print("Password: ${passwordController.text}");
                            logIn();
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xffD75D72),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 97,
                      ),
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          goTo(page: SignInView(), keepHistory: true);
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Color(
                            0xffD75D72,
                          ).withValues(alpha: .4),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffD75D72),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum lodingstate { loading, failed, error }
