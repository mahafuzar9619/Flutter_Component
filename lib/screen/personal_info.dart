import 'package:flutter/material.dart';
import 'package:flutter_component/controller/personal_info_controller.dart';
import 'package:flutter_component/controller/personal_info_update_controller.dart';
import 'package:flutter_component/model/user_model.dart';
import 'package:get/get.dart';

class Personal_Info extends StatefulWidget {
  const Personal_Info({super.key});

  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  final _per_controller = Get.put(Personal_Info_Controller());
  final _per_info_up_con = Get.put(Personal_Info_Update_Controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'personal information'.toUpperCase(),
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: size.height*.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.teal.shade200,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FutureBuilder(
                future: _per_controller.get_personal_info(),
                builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                               return Column(
                                 children: [
                                   SizedBox(height: size.height*.07,),
                                   Container(
                                     height: size.height*.3,
                                     width: size.width,
                                     padding: EdgeInsets.only(left: size.height*.02,top: size.height*.01,),
                                     decoration: BoxDecoration(
                                       color: Colors.teal.shade100,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     child: Column(
                                       children: [
                                         Text(
                                           '${snapshot.data!.full_name}',
                                           softWrap: true,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: size.height*.04,
                                           ),
                                         ),
                                         SizedBox(height: size.height*.01,),
                                         Text(
                                           '${snapshot.data!.occupation}',
                                           softWrap: true,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.normal,
                                             fontSize: size.height*.04,
                                           ),
                                         ),
                                         SizedBox(height: size.height*.01,),
                                         Text(
                                           '${snapshot.data!.gmail}',
                                           softWrap: true,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.normal,
                                             fontSize: size.height*.03,
                                           ),
                                         ),
                                         SizedBox(height: size.height*.01,),
                                         Text(
                                           '${snapshot.data!.mobile_no}',
                                           softWrap: true,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.normal,
                                             fontSize: size.height*.03,
                                           ),
                                         ),
                                         SizedBox(height: size.height*.01,),
                                         Text(
                                           'Age: ${snapshot.data!.age}',
                                           softWrap: true,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: size.height*.02,
                                           ),
                                         ),
                                         SizedBox(height: size.height*.01,),
                                         GestureDetector(
                                           onTap: (){
                                              User_Model user = snapshot.data as User_Model;
                                              var full_name = TextEditingController(text: user.full_name);
                                              var occupation = TextEditingController(text: user.occupation);
                                              var gmail = TextEditingController(text: user.gmail);
                                              var mobile_no = TextEditingController(text: user.mobile_no);
                                              var age = TextEditingController(text: user.age);

                                              showDialog(
                                                 context: context,
                                                 builder: (context) => AlertDialog(
                                                   backgroundColor: Colors.teal,
                                                   content: SizedBox(
                                                     width: size.width*.5,
                                                     height: size.height*.5,
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Container(
                                                         height: size.height,
                                                         width: size.width,
                                                         color: Colors.teal.shade100,
                                                         child: Padding(
                                                           padding: EdgeInsets.all(5),
                                                           child: SingleChildScrollView(
                                                             child: Column(
                                                               children: [
                                                                 TextField(
                                                                   controller: full_name,
                                                                   decoration: InputDecoration(
                                                                     fillColor: Colors.white60,
                                                                     filled: true,
                                                                     labelText: 'Full_Name',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(18),
                                                                       borderSide: BorderSide(
                                                                         color: Colors.black,
                                                                       ),
                                                                     ),
                                                                     contentPadding: EdgeInsets.only(left: 10,right: 10),
                                                                   ),
                                                                 ),
                                                                 SizedBox(height: size.height*.01,),
                                                                 TextField(
                                                                   controller: occupation,
                                                                   decoration: InputDecoration(
                                                                     fillColor: Colors.white60,
                                                                     filled: true,
                                                                     labelText: 'Occupation',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(18),
                                                                       borderSide: BorderSide(
                                                                         color: Colors.black,
                                                                       ),
                                                                     ),
                                                                     contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                   ),
                                                                 ),
                                                                 SizedBox(height: size.height*.01,),
                                                                 TextField(
                                                                   controller: gmail,
                                                                   decoration: InputDecoration(
                                                                     fillColor: Colors.white60,
                                                                     filled: true,
                                                                     labelText: 'gmail',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(18),
                                                                       borderSide: BorderSide(
                                                                         color: Colors.black,
                                                                       ),
                                                                     ),
                                                                     contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                   ),
                                                                 ),
                                                                 SizedBox(height: size.height*.01,),
                                                                 TextField(
                                                                   controller: mobile_no,
                                                                   decoration: InputDecoration(
                                                                     fillColor: Colors.white60,
                                                                     filled: true,
                                                                     labelText: 'Mobile_No',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(18),
                                                                       borderSide: BorderSide(
                                                                         color: Colors.black,
                                                                       ),
                                                                     ),
                                                                     contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                   ),
                                                                 ),
                                                                 SizedBox(height: size.height*.01,),
                                                                 TextField(
                                                                   controller: age,
                                                                   decoration: InputDecoration(
                                                                     fillColor: Colors.white60,
                                                                     filled: true,
                                                                     labelText: 'Age',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(18),
                                                                       borderSide: BorderSide(
                                                                         color: Colors.black,
                                                                       ),
                                                                     ),
                                                                     contentPadding: EdgeInsets.only(left: 10,right: 10),

                                                                   ),
                                                                 ),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   title: Center(
                                                     child: Text(
                                                         'update'.toUpperCase(),
                                                       style: TextStyle(
                                                         color: Colors.black,
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: size.height*.04,
                                                       ),
                                                     ),
                                                   ),
                                                   actionsAlignment: MainAxisAlignment.center,
                                                   alignment: Alignment.topCenter,
                                                   actions: [
                                                     GestureDetector(
                                                       onTap: (){
                                                          final user = User_Model(
                                                              full_name: full_name.text.trim(),
                                                              age: age.text.trim(),
                                                              occupation: occupation.text.trim(),
                                                              mobile_no: mobile_no.text.trim(),
                                                              gmail: gmail.text.trim(),
                                                          );
                                                      _per_info_up_con.UpdateRecord(user);
                                                       },
                                                       child: Container(
                                                         height: size.height*.04,
                                                         width: size.width*.3,
                                                         color: Colors.teal.shade100,
                                                         child: Center(
                                                           child: Text(
                                                             'Submit'.toUpperCase(),
                                                             style: TextStyle(
                                                               color: Colors.black,
                                                               fontSize: size.height*.03,
                                                               fontWeight: FontWeight.bold,
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ],
                                                 ));
                                           },
                                           child: Container(
                                             height: size.height*.03,
                                             width: size.width*.2,
                                             color: Colors.red.shade200,
                                             child: Center(
                                               child: Text(
                                                 'update'.toUpperCase(),
                                                 softWrap: true,
                                                 style: TextStyle(
                                                   fontSize: size.height*.02,
                                                   fontWeight: FontWeight.bold,
                                                   color: Colors.black,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   )
                                 ],
                               );
                    } else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }
                    else {
                      return Center(child: Text('error something',));
                    }
                 }else{
                   return const Center(child: CircularProgressIndicator(),);
                 }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
