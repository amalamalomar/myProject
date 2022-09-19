import 'dart:convert';
import 'package:charityapp/component/const.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/current_activity_controller.dart';
import 'package:charityapp/screens/Activity_Screen/delete_activity/delete_activity_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:charityapp/controller/model_Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/add_activity/Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/update_activites/update_activity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CurrentActivities extends StatefulWidget {
  CurrentActivities({Key? key}) : super(key: key);

  get l => _CurrentActivities().fff;

  // get fff => l;

  @override
  State<CurrentActivities> createState() => _CurrentActivities();
}

class _CurrentActivities extends State<CurrentActivities> {
  DeleteActivityController controller = DeleteActivityController();

  CurrentActivitiesController getCurActivController =
      CurrentActivitiesController();

  Future<CurrentActivCardModel> fetchdata() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/activities/0'));

    if (response.statusCode == 200) {
      return CurrentActivCardModel.fromJson(
          json.decode(response.body)); //jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Current Activities');
    }
  }

// //AddActivityModel listMode = AddActivityModel(data: [], message: '', status: 201);
  late Future<CurrentActivCardModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    // listMode.data = <Data>[];
    futureAlbum = fetchdata();
  }

  var fff;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    fff =
//      Obx((() {
//          if(getCurActivController.isLoding.isTrue){
// return Center(
//   child: CircularProgressIndicator(),
// );
//     }
//     return     funcListCurrent(myCards: getCurActivController.dataCurrentAct);          // funcListCurrent(myCards: snapshot.data!.data);
//      }));

        FutureBuilder<CurrentActivCardModel>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ?
                  //   Text("${snapshot.data!.data}")
                  funcListCurrent(myCards: snapshot.data!.data)
                  // ///////////////////////

                  : new Center(
                      child:
                          new CircularProgressIndicator(), //Text("Not found Current Activities"), //new CircularProgressIndicator(),
                    );
            });

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          "Current Activities",
          style: TextStyle(
            fontFamily: "Poppins",
            //  color: ,
          ),
        ),
        shadowColor: Colors.amber,
        backgroundColor: const Color.fromARGB(255, 16, 14, 85),

        actions: [
          IconButton(
              icon: const Icon(
                Icons.add, //notifications_active_outlined,
                color: Color.fromARGB(255, 243, 245, 246),
                size: 27,
              ),
              onPressed: () {
                // MycardCurentActivty() ,
                //MycardCurentActivty(Activity:myCards[index]) ,
                Get.toNamed('/addActivites');
              })
        ],
      ),

      drawer: Drawerfunc(),

      body: fff, //CurrentActivities().listview ,
    );
  }
}

///////////////////

class funcListCurrent extends StatelessWidget {
  CurrentActivitiesController getCurActivController =
      CurrentActivitiesController();

  List myCards = [];
  funcListCurrent({required this.myCards});
  int idActivity = 0;
  late int iduser;
  int index = 0;
  @override
  Widget build(BuildContext context) {
///////////////////
    Size size = MediaQuery.of(context).size;
/////////////////////
    return

        ///////////*/

        ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: myCards == null ? 0 : myCards.length,
            itemBuilder: (context, i) {
              return Column(
                //    mainAxisAlignment: MainAxisAlignment.start,

                ///////**//////
                children: [
                  Container(
                    height: 250,
                    ////////////////////
                    width: size.width,
                    //////////////////////
                    decoration: BoxDecoration(
                      //color: Color.fromARGB(255, 96, 116, 204),
                      borderRadius: BorderRadius.circular(25),
                      ////////////////////////////
                      border: Border.all(
                          // color: Color.fromARGB(255, 108, 167, 182),
                          color: const Color.fromARGB(255, 16, 14, 85),
                          width: 8),
                      boxShadow: [
                        const BoxShadow(
                          //  color: Color.fromARGB(255, 108, 167, 182),
                          color: const Color.fromARGB(255, 72, 222, 233),
                          offset: const Offset(-4, -4),
                        ),
                      ],
                      color: Colors.white,
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color.fromARGB(255, 16, 14, 85),
                          Colors.blue,
                          Color.fromARGB(255, 235, 225, 234),
                          Colors.white
                        ],
                      ),
                      ////////////////
                    ),

                    child: Column(
                      //    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 170,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 7,
                                  ),

                                  //Padding(padding: EdgeInsets.all(10)),
                                  RichText(
                                    text: TextSpan(
                                      text: "title   ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 17),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ":  ${myCards[i]['title'].toString()}", //${myCards[i]['title'].toString() }",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 16, 14, 85),
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Padding(
                                      padding: const EdgeInsets.all(10)),

                                  RichText(
                                    text: TextSpan(
                                      text: "Cost   ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 17),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              " :   ${myCards[i]['cost'].toString()}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 16, 14, 85),
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Padding(
                                      padding: const EdgeInsets.all(10)),

                                  RichText(
                                    text: TextSpan(
                                      text: "    description",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 17),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              " :    ${myCards[i]['description'].toString()}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 16, 14, 85),
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Padding(padding: const EdgeInsets.only(top: 7)),
                        //     SizedBox(height: 40,),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //          InkWell(
                              //           splashColor: Colors.amber,
                              //               onTap : (){

                              //               print("ff");
                              //              },

                              //            child: Container(

                              //                  alignment: Alignment.center,
                              //             height: 40,
                              //             width: 40,

                              //             decoration: BoxDecoration(

                              //               border: Border.all(
                              //                 color:const Color.fromARGB(255, 16, 14, 85),
                              //                 width: 2 ),
                              //              borderRadius: BorderRadius.circular(10),
                              //               gradient: const LinearGradient(
                              //                 begin: Alignment.topLeft,
                              //                 end: Alignment.bottomRight,

                              //                 colors: [
                              //                   Color.fromARGB(255, 6, 39, 130),
                              //                   Color.fromARGB(255, 28, 142, 203),
                              //                   const Color.fromARGB(255, 116, 218, 238),
                              //                   Color.fromARGB(255, 89, 98, 137),
                              //                   ],
                              //               ),
                              //             ),
                              //              child: const Text("تبرع",style: const TextStyle(
                              //                 fontSize: 10,
                              //                                     fontWeight: FontWeight.bold,
                              //                                     color: const Color.fromARGB(255, 86, 12, 78),
                              //                 // color: Color.fromARGB(255, 16, 14, 85)
                              //                 ),
                              //                                                   ),
                              //            ),
                              //          ),

                              //                              const SizedBox(width: 12,),

                              //     InkWell(
                              //           splashColor: Colors.amber,
                              //               onTap : (){

                              //               print("ff");
                              //              },

                              //            child: Container(

                              //                  alignment: Alignment.center,
                              //             height: 40,
                              //             width: 40,

                              //             decoration: BoxDecoration(

                              //               border: Border.all(color:const Color.fromARGB(255, 16, 14, 85),width: 2 ),
                              //               borderRadius: BorderRadius.circular(10),
                              //               gradient: const LinearGradient(
                              //                 begin: Alignment.topLeft,
                              //                 end: Alignment.bottomRight,
                              //                 colors: [
                              //                   Color.fromARGB(255, 6, 39, 130),
                              //                   Color.fromARGB(255, 28, 142, 203),
                              //                   Color.fromARGB(255, 116, 218, 238),
                              //                   Color.fromARGB(255, 89, 98, 137),
                              //                   ],
                              //               ),
                              //             ),
                              //              child: const Text("استفادة",style: const TextStyle(
                              //                 fontSize: 10,
                              //                                     fontWeight: FontWeight.bold,
                              //                  color: const Color.fromARGB(255, 16, 14, 85)),
                              //                                                   ),
                              //            ),
                              //          ),

                              //                              const SizedBox(width: 12,),

                              // InkWell(
                              //           splashColor: Colors.amber,
                              //               onTap : (){

                              //               print("ff");
                              //              },

                              //            child: Container(

                              //                  alignment: Alignment.center,
                              //             height: 40,
                              //             width: 40,

                              //             decoration: BoxDecoration(

                              //               border: Border.all(color:const Color.fromARGB(255, 16, 14, 85),width: 2 ),
                              //               borderRadius: BorderRadius.circular(10),
                              //               gradient: const LinearGradient(
                              //                 begin: Alignment.topLeft,
                              //                 end: Alignment.bottomRight,
                              //                 colors: [
                              //                   Color.fromARGB(255, 6, 39, 130),
                              //                   const Color.fromARGB(255, 28, 142, 203),
                              //                   const Color.fromARGB(255, 116, 218, 238),
                              //                   const Color.fromARGB(255, 89, 98, 137),
                              //                   ],
                              //               ),
                              //             ),
                              //              child: const Text("تطوع",style: TextStyle(
                              //                 fontSize: 10,
                              //                                     fontWeight: FontWeight.bold,
                              //                  color: Color.fromARGB(255, 16, 14, 85)),
                              //                                                   ),
                              //            ),
                              //          ),

                              const SizedBox(
                                width: 12,
                              ),

                              InkWell(
                                splashColor: Colors.amber,
                                onTap: () {
                                  delete();
                                  //  delete(myCards[i]['idActivity']);
                                  // deleteData(myCards[i]);

                                  //deleteData(widget.list[widget.index]['id']);
                                  //   deleteData(myCards[i]);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CurrentActivities(),
                                    ),
                                  );
                                  print("ff");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 16, 14, 85),
                                        width: 2),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        const Color.fromARGB(255, 6, 39, 130),
                                        const Color.fromARGB(255, 28, 142, 203),
                                        const Color.fromARGB(
                                            255, 116, 218, 238),
                                        const Color.fromARGB(255, 89, 98, 137),
                                      ],
                                    ),
                                  ),
                                  child: const Text(
                                    "حذف",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 16, 14, 85)),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 12,
                              ),

                              //                  InkWell(
                              //                             splashColor: Colors.amber,
                              //                                 onTap : (){

                              //  Navigator.of(context).push(
                              //                        MaterialPageRoute(
                              //                          builder:(
                              //                           BuildContext context)=> EditActivity(

                              //                             // [
                              //                               // myCards[i]['title'].toString(),myCards[i]['cost'].toString(),
                              //                               // myCards[i]['description'].toString(),myCards[i]['charity_id'].toString()
                              //                               // ],
                              //                               ),
                              //                           ),                            //MycardCurentActivty(Activity:myCards[index]) ,
                              //                      );
                              //                                 print("ff");
                              //                                },

                              //                              child: Container(

                              //                                    alignment: Alignment.center,
                              //                               height: 40,
                              //                               width: 40,

                              //                               decoration: BoxDecoration(
                              //                                 borderRadius: BorderRadius.circular(10),
                              //                                 border: Border.all(color:const Color.fromARGB(255, 16, 14, 85),width: 2 ),
                              //                                 gradient: const LinearGradient(
                              //                                   begin: Alignment.topLeft,
                              //                                   end: Alignment.bottomRight,
                              //                                   colors: [
                              //                                     const Color.fromARGB(255, 6, 39, 130),
                              //                                     Color.fromARGB(255, 28, 142, 203),
                              //                                     Color.fromARGB(255, 116, 218, 238),
                              //                                     const Color.fromARGB(255, 89, 98, 137),
                              //                                     ],
                              //                                 ),
                              //                               ),
                              //                                child: GestureDetector(
                              //                           onTap: (){
                              //                         Get.toNamed('/updateActivites');
                              //                           },
                              //                                  child: const Text("تعديل",style: const TextStyle(
                              //                                     fontSize: 10,
                              //                                                         fontWeight: FontWeight.bold,
                              //                                      color: const Color.fromARGB(255, 16, 14, 85)),
                              //                                                                       ),
                              //                                ),
                              //                              ),
                              //                            ),

                              const SizedBox(
                                width: 12,
                              ),

                              //                  RaisedButton(
                              //                              padding: EdgeInsets.all(25),
                              //                           shape: RoundedRectangleBorder(
                              //                           borderRadius: BorderRadius.all(Radius.circular(100),),
                              //                                                                    ),
                              //                            child:Text("تعديل",style: TextStyle(
                              //                               fontSize: 10,
                              //                          fontWeight: FontWeight.bold,
                              //                                color: Color.fromARGB(255, 16, 14, 85)),
                              //                                                                 ),
                              //                               color: Colors.white,
                              //                                onPressed: (){

                              // Navigator.of(context).push(
                              //                        MaterialPageRoute(
                              //                          builder:(
                              //                           BuildContext context)=> EditActivity(
                              //                             list:
                              //                             [myCards],
                              //                             // [
                              //                               // myCards[i]['title'].toString(),myCards[i]['cost'].toString(),
                              //                               // myCards[i]['description'].toString(),myCards[i]['charity_id'].toString()
                              //                               // ],
                              //                                index:i),
                              //                           ),                            //MycardCurentActivty(Activity:myCards[index]) ,
                              //                      );

                              //                                },
                              //                  ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],

                ////////**////////
              );
            });
  }

  DeleteActivityController controller = DeleteActivityController();

  delete() async {
    EasyLoading.show(status: 'is loading.....');
    await controller.delete(myCards[4]);
    if (controller.deleteActivityStatus) {
      EasyLoading.showSuccess('activity id deleted success');
      Get.toNamed('/currentActivites');
    } else {
      print("EEEEEEEEEEErrrrrrrrroooooooooooorrrrrrr");
      EasyLoading.showError('error');
    }
  }

//  deleteData(int id) async {

//    final prefs=await SharedPreferences.getInstance();
//     final key='token';
//     final value=prefs.get(key)?? 0;
// String myUrl= "https://charity-appp.000webhostapp.com/api/activities/$id ";
//  http.delete(myUrl,
// headers:{'Accept':'application/json',
//        'Authorization':'Bearer $value'
//   },
// ).then((response){
//   print('Response status :${response.statusCode}');
//     print('Response body :${response.body}');

// } );
// }

}
