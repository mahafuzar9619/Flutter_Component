import 'package:flutter/cupertino.dart';
import 'package:flutter_component/model/user_form_model.dart';
import 'package:flutter_component/repository/authentication/authentication_repository.dart';
import 'package:flutter_component/repository/form_repository.dart';
import 'package:get/get.dart';

class User_Form_Controller extends GetxController{
  static User_Form_Controller get interface => Get.find();


  var _authen_repo = Get.put(AuthenticationRepository());
  var _user_Repo = Get.put(User_Form_Repository());


  final full_Name = TextEditingController();
  final age = TextEditingController();
  final occupation = TextEditingController();
  final mobile_No = TextEditingController();
 late String gmail = _authen_repo.Current_Email();
user_form(User_Model user){
   _user_Repo.firebase_Create_form(user);
 }


}