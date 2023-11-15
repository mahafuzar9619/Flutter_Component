import 'package:flutter/cupertino.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class Login_Controller extends GetxController{
  static Login_Controller get instance => Get.find();


  final email = TextEditingController();
  final password = TextEditingController();

  final _auth = Get.put(AuthenticationRepository());

  Future<void>  SigninUser() async{
    print(email.toString());
    print(password.toString());
    await _auth.loginWithEmailAndPassword(email.text, password.text);
  }
}