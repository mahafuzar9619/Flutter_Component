import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_component/repository/authentication/exceptions/signin_email_failure.dart';
import 'package:flutter_component/screen/component/splashscreen.dart';
import 'package:flutter_component/screen/homepage.dart';

import 'package:flutter_component/screen/login_page.dart';
import 'package:flutter_component/screen/signup_page.dart';
import 'package:flutter_component/screen/user_form.dart';
import 'package:get/get.dart';

import 'exceptions/signup_email_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    //Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  //  ever(firebaseUser, _setInitialScreen);
  }
/*  _setInitialScreen(User? user) {
    user == null ? Get.offAll( ()=> SignUp_Page()) : Get.offAll(()=>Login_Page());
  }*/
Current_Email(){
  String? email = firebaseUser.value?.email;
  return email;
}

//for signup

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll( ()=> User_Form()) : Get.offAll( ()=> const SignUp_Page());
    } on FirebaseAuthException catch(e){
      final ex =  SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${e}');
    }catch (_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

//for login

  Future<dynamic> loginWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).
      then((value) {
        Get.to(()=>Home_Page());

      });
      // firebaseUser.value != null ? Get.offAll((){Fetchdatapage();}) : Get.to(()=>const SignupPage());
    }on FirebaseAuthException catch (e){
      final ex = SigninEmailPasswordFailure(e.code);
      print('FIREBASE AUTH EXCEPTION - ${e}');
    }catch(_){
      const ex = SigninEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      // throw ex;
    }
  }
}