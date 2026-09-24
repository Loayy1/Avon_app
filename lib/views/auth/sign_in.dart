import 'package:cosmetics_app/core/helper_methods.dart';
import 'package:cosmetics_app/views/auth/log_in.dart';
import 'package:cosmetics_app/views/auth/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isOccurred = true;
  bool isOccurredInConfirm = true;

  int phoneCode = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Form(
              onChanged: () {
                setState(() {});
              },
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset("assets/images/logo.png", height: 62, width: 67),
                  SizedBox(height: 40),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    controller: nameController,
                    cursorColor: Color(0xff434C6D),
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  SizedBox(height: 38),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Color(0xff434C6D),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  SizedBox(height: 33),
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
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: isOccurred,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Create your password",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          isOccurred= !isOccurred;
                          setState(() {

                          });
                        });
                      },icon: SvgPicture.asset(
                          "assets/icons/visibility_${isOccurred? "off":"on"}.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: isOccurredInConfirm,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8EA9),
                      ),
                      suffixIcon: IconButton(onPressed: () {
                        isOccurredInConfirm= !isOccurredInConfirm;
                        setState(() {

                        });
                      },
                        icon: SvgPicture.asset(
                          "assets/icons/visibility_${isOccurredInConfirm? "off":"on"}.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17),
                  TextButton(
                    onPressed:
                        nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty
                        ? null
                        : () {
                            goTo(page: VerifyView());
                          },
                    style: TextButton.styleFrom(disabledBackgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 117,
                      ),
                      backgroundColor: Color(0xffD75D72),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Next", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          color: Color(0xff434C6D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          goTo(page: LogInView());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xffD75D72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
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
