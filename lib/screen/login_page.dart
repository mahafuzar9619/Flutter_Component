import 'package:flutter/material.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:get/get.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final controller = Get.put(Login_Controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                              "Signin",
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
                              onTap: () {},
                              controller: controller.email,
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
                              onTap: () {},
                              controller: controller.password,
                              obscureText: true,
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
                            ),
                            SizedBox(
                              height: size.height * .03,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.SigninUser();
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
                                SizedBox(width: size.width*.41),
                                GestureDetector(
                                  onTap: () {},
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
      ),
    );
  }
}
