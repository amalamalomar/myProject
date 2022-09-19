import 'dart:convert';
import 'package:get/get.dart';
import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:charityapp/controller/model_Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/add_activity/add_activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class AddCurrentActivity extends StatefulWidget {
  const AddCurrentActivity({Key? key}) : super(key: key);
  @override
  State<AddCurrentActivity> createState() => _AddCurrentActivity();
}

class _AddCurrentActivity extends State<AddCurrentActivity> {
  // DatabaseHelper databaseHelper=new DatabaseHelper();

  //AddActivityModel lis=AddActivityModel(data:[],message: "",status: 201);

  Future<AddActivityModel> addActivity(String title, cost, description) async {
    final http.Response response = await http.post(
      'https://charity-appp.000webhostapp.com/api/activities',
      headers: <String, String>{
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGI0ZjA3ODkxMjYxNGQ5NzE3YmRlYjliYTU4MGRmMjBlNGU0MWM0Yjg2YjIyMDNiZTI4OGY3OTNkOWE0ZDAyYjI3MTBlNDAwYjZjNGU1M2UiLCJpYXQiOjE2NTgxNzg2NTguMzk0NDQ5LCJuYmYiOjE2NTgxNzg2NTguMzk0NDUzLCJleHAiOjE2ODk3MTQ2NTguMzkwMzQ1LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.vQSjHT0kbFD7ljPFdPcBIaAnXmUuHhdzdXihweG0W3vFw0ApqcKt1NxiHJ2Op2_HbdBtu5D4ijCAo0iv8UGKsOHVgG-oifKYxGW3Gp8QXUvNKSKA-XqQLpJL0i7JmeoD5s5wJ7EgOQzQUwFRn-uzByELRUHAGWlNV2bDTvYAVmYLws6NO5slAkEc6H7BqrJVg1hzHOtoVte8FCj3IPWQ1Exas6rMH12NIiKoZZoyaXdwi21tLHrwFW22kPLQvWGxtwDJ2P6FUtWkZddwz2Z1Tc4iCTj41v64BOG_TCqAYTnkZS16JBVpZaop9fOtA-BWKJ-20u5rSOf6AwudV7asysKs_zZGX4A6yagnlMsRdGCmdb-G5d-2Fwu-JSUn6kOpiFKYKchFIBlovHWeshuKTHPZb7MCl1m3A2mc1e1wOgGNeXJfiUyDsD3pn__fxSoH3GN2pDtTqqpPRtxONVyfwnRAyPYrl1rKGDWUld0HhYdUvnmjakdrT4bzz3xppyCVujMAJXVAgerM678HQCjexpGn4efUKX-fy4F2z-GGriF6MvV7NtqcCUY-5G-IV18fJzojOvSQA-S4gE0rrkc96LopzJzX8ELsnSnXljIAl1cKI90vruF882LHcB6n3mD68Ltq7PP5IxCHNN_wlTHsepCl3CVfurdxGSVudAvUJlY',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        // "data": Data.fromJson(json.decode(title)),
        'title': Data.fromJson(json.decode(title)),
        'cost': Data.fromJson(json.decode(cost)),
        'description': Data.fromJson(json.decode(description)),
        // 'charity_id':Data.fromJson(json.decode(charity_id)),
        // "data": data.toJson()
      }),
    );
    if (response.statusCode == 201) {
      print("done");
      return AddActivityModel.fromJson(json.decode(response.body));
    } else {
      print("Noooooo");
      throw Exception('Failed to load album');
    }
  }

////
  late Future<AddActivityModel> futureAlbum;
//  @override
//   void initState() {

//           futureAlbum= addActivity( _titleController.text.toString(),
//                          _costController.text,
//                           _descriptionController.text,
//                            _charityIdController.text);

//     // TODO: implement initState
//     super.initState();

//   }

/////

  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _costController = new TextEditingController();
  final TextEditingController _descriptionController =
      new TextEditingController();
  // final TextEditingController _charityIdController =
  //     new TextEditingController();
  // final TextEditingController _completedController =
  //     new TextEditingController();

      AddActivityController controller=AddActivityController();


void addActivities() async{
  
      EasyLoading.show(status: 'is loading.....');
      await controller.addActivity(_titleController.text.trim(), _costController.text.trim(),
       _descriptionController.text.trim());
      if(controller.addActivityStatus)
      {
        EasyLoading.showSuccess('add activity success');
        Get.toNamed('/currentActivites');
      }
      else{
        EasyLoading.showError('error!');
      }
    }
 late int iduser;

  @override
  Widget build(BuildContext context) {
    //  throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Activity',
      color: Color.fromARGB(255, 16, 14, 85),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Activity'),
          backgroundColor: Color.fromARGB(255, 16, 14, 85),
        ),
        body: Container(
          child: ListView(
            padding:
                EdgeInsets.only(top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                //  decoration: BoxDecoration( color: Color.fromARGB(255, 231, 233, 233),
                //             borderRadius:BorderRadius.circular(10),),
                height: 50,
                child: TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('title'),
                    hintText: 'Activity title',
                    icon: Icon(Icons.blur_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                // decoration: BoxDecoration(

                //   color: Color.fromARGB(255, 231, 233, 233),
                //           borderRadius:BorderRadius.circular(10),),
                height: 50,
                child: TextField(
                  controller: _costController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('cost'),
                    hintText: 'Activity cost',
                    icon: Icon(Icons.money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                // decoration: BoxDecoration( color: Color.fromARGB(255, 231, 233, 233),
                //     borderRadius:BorderRadius.circular(10),),
                height: 50,
                child: TextField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('description'),
                    hintText: 'Activity description',
                    icon: Icon(Icons.border_clear),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 16, 14, 85),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //     Container(
              //     //  color: Color.fromARGB(255, 231, 233, 233),

              //       // decoration: BoxDecoration( color: Color.fromARGB(255, 231, 233, 233),
              //       //   borderRadius:BorderRadius.circular(10),),
              //     height: 52,
              //     child: TextField(
              //      controller: _charityIdController ,
              //      keyboardType: TextInputType.number,
              //      decoration: InputDecoration(

              //        label: Text('charityId'),
              //        hintText: 'Activity charityId',
              //        icon: Icon(Icons.vpn_key),
              //             border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //            borderSide: const BorderSide(color: Color.fromARGB(255, 16, 14, 85),),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           borderSide: const BorderSide(color: Colors.blue),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           borderSide: const BorderSide(
              //             color: Color.fromARGB(255, 16, 14, 85),
              //             width: 1,
              //           ),
              //         ),
              //      ),

              //       ),
              //  ),

              Padding(
                padding: EdgeInsets.only(top: 90.0),
              ),

              Center(
                child: Material(
                  color: Color.fromARGB(255, 6, 22, 72),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(30),
                  //width: 150,

                  child: MaterialButton(
                    onPressed: () {
                           addActivities();

                      //   Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder:(BuildContext context)=>  CurrentActivities(),
                      //      ),
                      // );

                      //  if(_titleController.text ==null || _costController.text==null
                      //          || _descriptionController.text==null ||_charityIdController.text==null){

                      //     Center(child: Text(" Error add title or cost or description or charityId"),) ;
                      //                       }else{

                      //         //   Navigator.of(context).push(
                      //         //   MaterialPageRoute(
                      //         //     builder:(BuildContext context)=>  CurrentActivities(),
                      //         //      ),
                      //         // );
                      //         }
                    },

                    height: 60,
                    minWidth: 200,
                    //   minWidth: double.infinity,
                    child: Text(
                      'Add  Activity',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              /////////////////////
//                      Container(

//                   height: 50,

//                   child: RaisedButton(

//                   onPressed:(){
//  setState(() {
//      AddActivityModel(data:
//     Data(title: _titleController.text.toString(),
//                                 cost: _costController.text, description:
//                                  _descriptionController.text,
//                                  charityId: _charityIdController.text),message: "",status: 201
//   );
//  });

//                         Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder:(BuildContext context)=>  CurrentActivities(),
//                            ),
//                       );
//                if(_titleController.text ==null || _costController.text==null
//                        || _descriptionController.text==null ||_charityIdController.text==null){

//                   Center(child: Text(" Error add title or cost or description or charityId"),) ;
//                                     }else{

//                         Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder:(BuildContext context)=>  CurrentActivities(),
//                            ),
//                       );
//                       }
//                   },
//                   color: Color.fromARGB(255, 16, 14, 85),

//                   child: Text('Add',
//                               style: TextStyle(color: Colors.white,
//                              // backgroundColor: Colors.pink
//                               ),

//                   ),

//                     ),

//                ),

              Padding(
                padding: EdgeInsets.only(top: 44.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
