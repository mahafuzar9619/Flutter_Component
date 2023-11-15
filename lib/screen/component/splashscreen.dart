import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_component/main.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:flutter_component/screen/login_page.dart';
import 'package:flutter_component/screen/signup_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Splash_Main extends StatefulWidget {
  const Splash_Main({super.key});

  @override
  State<Splash_Main> createState() => _Splash_MainState();
}

class _Splash_MainState extends State<Splash_Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     super.initState();

  Timer(Duration(seconds: 9), () {

    Get.off(()=>SignUp_Page());
  });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: Column(
          children: [
            SizedBox(height: size.height/2.5,),
            Center(
              child: Text('welcome, to my flutter word'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(height: 30,),
            SpinKitThreeInOut(
              color: Colors.red[200],
              size: 30,
              duration: Duration(seconds: 5,),
            ),
          ],
        ),
      ),
    );
  }
}
