import 'dart:convert';
import 'dart:io';
import 'package:charityapp/component/const.dart';
import 'package:charityapp/controller/model_Login.dart';
import 'package:charityapp/controller/model_Register.dart';
import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:charityapp/screens/home_page/homePage_controller.dart';
import 'package:charityapp/screens/home_page/homePage_services.dart';
import 'package:charityapp/screens/log_in/login.dart';
import 'package:charityapp/screens/register/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomePageController controller = HomePageController();

  int index_MyHomePageState = 0;
  static int index = 0;

  Future<Modelcharities> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/charities'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Modelcharities.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<Modelcharities> futureAlbum;

//  Future<HomePageController> getDataCharities() async{

//       EasyLoading.show(status: 'is loading.....');
//       await controller.getdatacharities();
//       if(controller.getdatacharitiesStatus)
//       {
//         EasyLoading.showSuccess('add activity success');
//         Get.toNamed('/currentActivites');
//       }
//       else{
//         EasyLoading.showError('error!');
//        // Text("${controller.data[index].imgUrl}");
//       }
//     }
  late Future<HomePageController> futurech;

  @override
  void initState() {
    super.initState();
    // controller=getDataCharities();
    futureAlbum = fetchAlbum();
    // futurech = getDataCharities();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 14, 85),
        title: Text('Home'),
      ),
      drawer: Drawerfunc(),
      body:
//   Obx((){
//     if(controller.isLoding.isTrue){
// return Center(
//   child: CircularProgressIndicator(),
// );
//     }
//     return  ListView(
//     padding: EdgeInsets.only(top:10,left: 50,right: 50,bottom: 10),
//     children:[

//      Container(

//       //  width:double.infinity,
//       height: 300,
//         padding:EdgeInsets.symmetric(horizontal:10,vertical:6),
//         decoration: BoxDecoration(
//         color: Color.fromARGB(255, 16, 14, 85),
//         // borderRadius: BorderRadius.only(
//         // bottomLeft: Radius.circular(75),
//         // bottomRight: Radius.circular(75),
//         //    ),
//            shape: BoxShape.circle,
//          ),
//             child: Stack(
//                    alignment:Alignment.bottomCenter,
//                        children: [
//                          Container(
//                           //  height: size.width*0.7,
//                           //  width: size.width*0.7,
//                            decoration: BoxDecoration(
//                              color: Colors.blueGrey,
//                              shape: BoxShape.circle,
//                            ),
//                          ),
//                            CircleAvatar(
//                            // controller.data[index_MyHomePageState].imgUrl
//                             backgroundImage:AssetImage("lib/assets/${controller.dataList[index_MyHomePageState].imgUrl}"),
//         //  backgroundImage:AssetImage("lib/assets/${snapshot.data!.data[index_MyHomePageState].imgUrl}"),//AssetImage("lib/assets/IMG-20220616-WA0002.jpg"),

//                         //NetworkImage(snapshot.data!.data[index_MyHomePageState].imgUrl),
//                       //  AssetImage("lib/assets/IMG-20220616-WA0002.jpg"),
//                            radius: 200,

//                          ),
//                        ],
//                      ),
//         ),

// Padding(padding: EdgeInsets.all(20)),

// Container(

//   child:Column(
//   crossAxisAlignment: CrossAxisAlignment.start,

//     children:[
//      //  Padding(padding: EdgeInsets.all(10)),

//       Text("Informatin about charity :  ",style: TextStyle(
//         fontSize: 19,
//         fontWeight: FontWeight.bold,
//          color: Color.fromARGB(255, 6, 52, 90),

//        // color: Color.fromARGB(255, 16, 14, 85),
//         ),
//         ),
//         Padding(padding: EdgeInsets.all(10)),

// RichText(
//   text: TextSpan(
//     text: "WorkingHours :    ",
//                   style: TextStyle(
//                 fontSize: 15,
//                    fontWeight: FontWeight.bold,
//                     // color: Colors.black,
//                    color:  Color.fromARGB(255, 76, 68, 185),
//                      ),
// children: <TextSpan>[
//   TextSpan(text: controller.message,style: TextStyle(
//     /*
//   TextSpan(text: snapshot.data!.data[index_MyHomePageState].workingHours.toString(),style: TextStyle( */
//         fontSize: 14,
//         fontWeight: FontWeight.normal,

//          color: Colors.black,//Color.fromARGB(255, 76, 68, 185)
//          ),),
// ],

// ),),

//         Padding(padding: EdgeInsets.all(10)),

// RichText(
//   text: TextSpan(
//     text: "Phone number :    ",
//                   style: TextStyle(
//                 fontSize: 15,
//                    fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 76, 68, 185),
//                      //color: Colors.black,
//                      ),
// children: <TextSpan>[
//   TextSpan(text: controller.dataList[index_MyHomePageState].telephone.toString(),style: TextStyle(
//     /*TextSpan(text: snapshot.data!.data[index_MyHomePageState].telephone.toString(),style: TextStyle( */
//         fontSize: 14,
//         fontWeight: FontWeight.normal,
//         color: Colors.black,
//        //  color: Color.fromARGB(255, 76, 68, 185),
//          ),),
// ],

// ),),

//         //
//         Padding(padding: EdgeInsets.all(10)),

// RichText(
//   text: TextSpan(
//     text: "Description :   ",
//                   style: TextStyle(
//                 fontSize: 15,
//                    fontWeight: FontWeight.bold,
//                    //  color: Colors.black
//                       color: Color.fromARGB(255, 76, 68, 185),
//                      ),
// children: <TextSpan>[
//   TextSpan(text: controller.dataList[index_MyHomePageState].description.toString(),style: TextStyle(
//     /*
//   TextSpan(text: snapshot.data!.data[index_MyHomePageState].description.toString(),style: TextStyle( */
//         fontSize: 14,
//         fontWeight: FontWeight.normal,
//          color: Colors.black,//Color.fromARGB(255, 76, 68, 185),
//          ),),
// ],

// ),
// ),

//     ],
//     ),
// ),

// Padding(padding: EdgeInsets.all(20)),

//    RaisedButton(
//          padding: EdgeInsets.all(25),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(50),),
//            ),
//          child:Text('Current Activities',style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//          color: Colors.white),
//         ),
//         color: Color.fromARGB(255, 16, 14, 85),
//          onPressed: (){},
//          ),

// Padding(padding: EdgeInsets.all(8)),
//             RaisedButton(
//                padding: EdgeInsets.all(25),
//                      color: Color.fromARGB(255, 16, 14, 85),
//                 shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(50),),
//            ),
//          child:Text('Past Activities',style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//         ),
//         ),
//          onPressed: (){},
//          ),

// Padding(padding: EdgeInsets.all(8)),

//             RaisedButton(
//                padding: EdgeInsets.all(25),
//         color: Color.fromARGB(255, 16, 14, 85),
//                 shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(50),),
//            ),
//          child:Text('Reviews',style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//          color: Colors.white,
//          ),
//         ),
//          onPressed:(){},
//          ),
//          Padding(padding: EdgeInsets.all(20)),
//        ],
//        )      ;

//   },
//   ),

          FutureBuilder<Modelcharities>(
        future: futureAlbum, //future:futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if (snapshot.hasData) {
            return ListView(
              padding:
                  EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
              children: [
                Container(
                  //  width:double.infinity,
                  height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 14, 85),
                    // borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(75),
                    // bottomRight: Radius.circular(75),
                    //    ),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        //  height: size.width*0.7,
                        //  width: size.width*0.7,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      CircleAvatar(
                        // backgroundImage:AssetImage("lib/assets/${controller.data[index_MyHomePageState].imgUrl}"),
                        backgroundImage: AssetImage(
                            "lib/assets/${snapshot.data!.data[index_MyHomePageState].imgUrl}"), //AssetImage("lib/assets/IMG-20220616-WA0002.jpg"),

                        //NetworkImage(snapshot.data!.data[index_MyHomePageState].imgUrl),
                        //  AssetImage("lib/assets/IMG-20220616-WA0002.jpg"),
                        radius: 200,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Padding(padding: EdgeInsets.all(10)),

                      Text(
                        "Informatin about charity :  ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 6, 52, 90),

                          // color: Color.fromARGB(255, 16, 14, 85),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),

                      RichText(
                        text: TextSpan(
                          text: "WorkingHours :    ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                            color: Color.fromARGB(255, 76, 68, 185),
                          ),
                          children: <TextSpan>[
                            // TextSpan(text: controller.data[index_MyHomePageState].workingHours.toString(),style: TextStyle(

                            TextSpan(
                              text: snapshot.data!.data[index_MyHomePageState]
                                  .workingHours
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,

                                color: Colors
                                    .black, //Color.fromARGB(255, 76, 68, 185)
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.all(10)),

                      RichText(
                        text: TextSpan(
                          text: "Phone number :    ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 76, 68, 185),
                            //color: Colors.black,
                          ),
                          children: <TextSpan>[
                            // TextSpan(text: controller.data[index_MyHomePageState].telephone.toString(),style: TextStyle(
                            TextSpan(
                              text: snapshot
                                  .data!.data[index_MyHomePageState].telephone
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                //  color: Color.fromARGB(255, 76, 68, 185),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //
                      Padding(padding: EdgeInsets.all(10)),

                      RichText(
                        text: TextSpan(
                          text: "Description :   ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            //  color: Colors.black
                            color: Color.fromARGB(255, 76, 68, 185),
                          ),
                          children: <TextSpan>[
                            // TextSpan(text: controller.data[index_MyHomePageState].description.toString(),style: TextStyle(

                            TextSpan(
                              text: snapshot
                                  .data!.data[index_MyHomePageState].description
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors
                                    .black, //Color.fromARGB(255, 76, 68, 185),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                RaisedButton(
                  padding: EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Current Activities',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 16, 14, 85),
                  onPressed: () {
                    Get.toNamed('/currentActivites');
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  padding: EdgeInsets.all(25),
                  color: Color.fromARGB(255, 16, 14, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Past Activities',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('/PastActivities');
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  padding: EdgeInsets.all(25),
                  color: Color.fromARGB(255, 16, 14, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('/Reviews');
                  },
                ),
                Padding(padding: EdgeInsets.all(20)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
