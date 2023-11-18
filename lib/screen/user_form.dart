import 'package:flutter/material.dart';
import 'package:flutter_component/controller/user_form_controller.dart';
import 'package:flutter_component/model/user_form_model.dart';
import 'package:get/get.dart';

class User_Form extends StatefulWidget {
  const User_Form({super.key});

  @override
  State<User_Form> createState() => _User_FormState();
}

class _User_FormState extends State<User_Form> {
  var controller = Get.put(User_Form_Controller());
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
            child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                           Center(
                             child: Padding(
                               padding: const EdgeInsets.only(top: 40),
                               child: Text(
                                   'Informention',
                                 softWrap: true,
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 35,
                                 ),
                               ),
                             ),
                           ),
                        SizedBox(height: size.height*.07,),
                        TextField(
                          controller: controller.full_Name,
                          onTap: (){

                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),

                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                            ),
                            focusColor: Colors.black12,
                            contentPadding: EdgeInsets.only(left: 20,right:20),
                          ),
                        ),
                        SizedBox(height: size.height*.02,),
                        TextField(
                           controller: controller.age,
                          onTap: (){

                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),

                            labelText: 'Age',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                            ),
                            focusColor: Colors.black12,
                            contentPadding: EdgeInsets.only(left: 20,right:20),
                          ),
                        ),
                        SizedBox(height: size.height*.02,),
                        TextField(
                           controller: controller.occupation,
                          onTap: (){

                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),

                            labelText: 'Occupation',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                            ),
                            focusColor: Colors.black12,
                            contentPadding: EdgeInsets.only(left: 20,right:20),
                          ),
                        ),
                        SizedBox(height: size.height*.02,),
                        TextField(
                          controller: controller.mobile_No,
                          onTap: (){

                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),

                            labelText: 'Mobile No',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                            ),
                            focusColor: Colors.black12,
                            contentPadding: EdgeInsets.only(left: 20,right:20),
                          ),
                        ),
                        SizedBox(height: size.height*.04,),
                        GestureDetector(
                          onTap: (){
                             var user = User_Model(
                                 full_name: controller.full_Name.text.trim(),
                                 age: controller.age.text.trim(),
                                 occupation: controller.occupation.text.trim(),
                                 mobile_no: controller.mobile_No.text.trim(),
                                 gmail: controller.gmail.toString().trim()
                            );
                                controller.user_form(user);
                          },
                          child: Container(
                            height: size.height*.09,
                            width: size.width*.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white54,
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
      )
    );
  }
}
