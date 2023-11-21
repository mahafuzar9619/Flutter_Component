
import 'package:flutter_component/model/user_model.dart';
import 'package:flutter_component/screen/login_page.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class User_Form_Repository extends GetxController{
  static User_Form_Repository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future firebase_Create_form (User_Model user) async{
    await _db.collection("User_Form").add(user.toJson()).whenComplete(() => Get.to(()=> Login_Page()));
  }

/*  Future firebase_Create_form (User_Model user) async{
  await _db.collection("User_Form").add(user.toJson()).whenComplete(() => Get.to(()=>Login_Page()
    *//*Get.snackbar(
      'Success',
      'Your acoount have been created',
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white10,
    colorText: Colors.green,
    duration: Duration(seconds: 2),
  ).printError(info: 'Form_repo input firebase some wrong')*//*);
  }*/
}