import 'package:cosmetics_app/core/helper_methods.dart';
import 'package:cosmetics_app/views/pages/home.dart';
import 'package:flutter/material.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> codeController = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  void dispoose() {
    for (var controller in codeController) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
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
                  "Verify Code",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "We just sent a 4-digit verification code to \nyour email amramer522@gmail.com. Enter \nthe code in the box below to continue.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8E8EA9),
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xffD75D72).withValues(alpha: .4),
                    ),
                    child: Text(
                      "Edit the number",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffD75D72),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffD75D72),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: codeController[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0x38101010),
                          maxLength: 1,
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(
                                context,
                              ).requestFocus(focusNodes[index + 1]);
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 43),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Didn’t receive a code? ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color(
                          0xffD75D72,
                        ).withValues(alpha: .1),
                      ),
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0x8AD75D72),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "0:36",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 113),
                TextButton(
                  onPressed:
                      codeController[0].text.isEmpty ||
                          codeController[1].text.isEmpty ||
                          codeController[2].text.isEmpty ||
                          codeController[3].text.isEmpty
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/done_verify.png",
                                    ),
                                    SizedBox(height: 26),
                                    Text(
                                      "Account Activated!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff434C6D),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Congratulations! Your account \nhas been successfully activated",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff8E8EA9),
                                      ),
                                    ),
                                    SizedBox(height: 23),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          goTo(page: HomeView());
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xffD75D72),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 18,
                                          horizontal: 91,
                                        ),
                                      ),
                                      child: Text(
                                        "Go to home",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                  style: TextButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Color(0xffD75D72),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 21,
                      horizontal: 115,
                    ),
                  ),
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
