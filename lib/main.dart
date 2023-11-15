
import 'package:flutter/material.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:flutter_component/screen/component/splashscreen.dart';
import 'package:flutter_component/screen/signup_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA8qjWM2zgsgLHP2NtQ4MN8MQCXo9285hE",
          appId: "1:945125698924:android:c386de0f6f023991e21749",
          messagingSenderId: "945125698924",
          projectId: "flutter-component-b933c"))
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(Splash_Main());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp_Page(),
    );
  }
}
