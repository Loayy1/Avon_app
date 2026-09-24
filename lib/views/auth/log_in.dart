import 'package:cosmetics_app/core/helper_methods.dart';
import 'package:cosmetics_app/views/auth/sign_in.dart';
import 'package:cosmetics_app/views/auth/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/home.dart';
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
  int phoneCode = 20;

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
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff434C6D),
                          ),
                          items: [
                            DropdownMenuItem(value: 20, child: Text("+20")),
                            DropdownMenuItem(value: 212, child: Text("+212")),
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
                      hintText: "Your Password",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
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
                        goTo(page: ForgetPasswordView());
                        setState(() {

                        });
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
                            goTo(page: HomeView());
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
                          goTo(page: SignInView());
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
