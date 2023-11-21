import 'package:flutter/material.dart';
import 'package:flutter_component/controller/personal_info_controller.dart';
import 'package:get/get.dart';

class Personal_Info extends StatefulWidget {
  const Personal_Info({super.key});

  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  final _per_controller = Get.put(Personal_Info_Controller());
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
