import 'package:flutter/cupertino.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class SignUp_Controller extends GetxController{
  static SignUp_Controller get instance => Get.find();
  final _auth_repo = Get.put(AuthenticationRepository());

// text field controller to get data from TextField
final gmail = TextEditingController();
final password = TextEditingController();
final re_password = TextEditingController();

  void registerUser(String email,String password){
    _auth_repo.createUserWithEmailAndPassword(email, password);
  }
}