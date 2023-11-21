import 'package:flutter/material.dart';
import 'package:flutter_component/controller/all_info_controller.dart';
import 'package:get/get.dart';

class All_Info extends StatefulWidget {
  const All_Info({super.key});

  @override
  State<All_Info> createState() => _All_InfoState();
}

class _All_InfoState extends State<All_Info> {
  final _allInfocon = Get.put(All_Info_Controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
                "All User details".toUpperCase(),
              softWrap: true,
              style: TextStyle(
                fontSize: h*.04,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: h,
            width: w,
            color: Colors.teal.shade200,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: FutureBuilder(
                future: _allInfocon.getAllUserdata(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
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
                                        snapshot.data![index].full_name,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height*.04,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].occupation,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.04,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].gmail,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.03,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        snapshot.data![index].mobile_no,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: size.height*.03,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.01,),
                                      Text(
                                        'Age: ${snapshot.data![index].age}',
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height*.02,
                                        ),
                                      ),
                                      SizedBox(height: size.height*.03,),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                      );
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }else{
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
