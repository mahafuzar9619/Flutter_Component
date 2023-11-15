import 'package:flutter/material.dart';
import 'package:flutter_component/controller/signup_controller.dart';
import 'package:flutter_component/screen/login_page.dart';
import 'package:get/get.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
 var controllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerr = Get.put(SignUp_Controller());

  }
  var controller = Get.put(SignUp_Controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.teal.shade200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .1,
                          ),
                          Text(
                            "SignUp",
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .07,
                          ),
                          TextField(
                            controller: controller.gmail,
                            onTap: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20,right: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                fillColor: Colors.white54,
                                filled: true,
                                labelText: 'Gmail',
                                helperStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                helperMaxLines: 20),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          TextField(
                            controller: controller.password,
                            onTap: () {},
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20,right: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                fillColor: Colors.white54,
                                filled: true,
                                labelText: 'Password',
                                helperStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                                helperMaxLines: 20),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          TextField(
                            controller: controller.re_password,
                            onTap: () {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20,right: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              fillColor: Colors.white54,
                              filled: true,
                              labelText: 'Re-password',
                              helperStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              helperMaxLines: 20,
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  String ttpassword =
                                      controller.password.text.toString();
                                  String ttre_password =
                                      controller.re_password.text.toString();
                                  if (ttpassword == ttre_password) {
                                    SignUp_Controller.instance
                                        .registerUser(
                                        controller.gmail.text.trim(),
                                        controller.password.text.trim(),
                                    );
                                  } else {
                                    Get.snackbar(
                                      'Password not match',
                                      'Please retype your password',
                                      colorText: Colors.black,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.white54,
                                    );
                                  }

                                  controller.re_password.clear();
                                  controller.password.clear();
                                  controller.gmail.clear();
                                },
                                child: Container(
                                  height: 60,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white54,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * .41),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => Login_Page());
                                },
                                child: Container(
                                  height: 60,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white54,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
