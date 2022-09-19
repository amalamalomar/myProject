
import 'dart:convert';
import 'package:charityapp/component/const.dart';
import 'package:charityapp/configuration/api.dart';
import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/Current_Activities.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/current_activity_controller.dart';
import 'package:charityapp/screens/Activity_Screen/past_activities/Past_Activities.dart';
import 'package:charityapp/screens/Activity_Screen/past_activities/past_activities_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';  
 import 'package:http/http.dart' as http;




class Cur_Pas_Activities extends StatefulWidget {


  Cur_Pas_Activities({Key? key}) : super(key: key);
  
  @override
  State<Cur_Pas_Activities> createState() => _Cur_Pas_Activities();
  

}


class _Cur_Pas_Activities extends State<Cur_Pas_Activities>{
  
//class MyApp extends StatefulWidget {  
  int index=0;
 
 

     Future<CurrentActivCardModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse(baseUrl +'/activities/0'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CurrentActivCardModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Current Activities');
  }
}     

 late Future<CurrentActivCardModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum =fetchAlbum();
        futureAlbumPast =fetchAlbumPast();

  }



  
     Future<PastActivCardModel> fetchAlbumPast() async {
  final response = await http
      .get(Uri.parse( baseUrl + '/activities/1'));

  if (response.statusCode == 200) {
    
    return PastActivCardModel.fromJson(jsonDecode(response.body));
  } else {
   
    
    throw Exception('Failed to load previous Activities');
  }
}     

 late Future<PastActivCardModel> futureAlbumPast;

CurrentActivitiesController getCurActivController= new CurrentActivitiesController();

  PastActivitiesController pastcontroller=new PastActivitiesController();

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
          debugShowCheckedModeBanner: false,

      home: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          appBar: AppBar(  
               title:  Text('Activity'),
              backgroundColor:  Color.fromARGB(255, 16, 14, 85),
          
            bottom: TabBar(  

    labelColor: Color.fromARGB(255, 96, 155, 210),
               unselectedLabelColor: Color.fromARGB(255, 154, 127, 127),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            //    unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color.fromARGB(255, 96, 155, 210);
                  } 
                  return Color.fromARGB(0, 180, 186, 115);
                }),
                
                indicatorWeight: 3,

              tabs: [  
                Tab(icon: Icon(Icons.contacts), text: "انشطة حالية")  ,
                Tab(icon: Icon(Icons.contacts), text: "انشطة سابقة",),  

              ],  
            ),  
          ),  
         
          drawer: Drawerfunc(),
   
          body: TabBarView(  
            children: [  

        //          Obx((() {
        //  if(getCurActivController.isLoding.isTrue){
        //             return Center(
        //                        child: CircularProgressIndicator(),
        //                           );
        //               }
        //     return     funcListCurrent(myCards: getCurActivController.dataCurrentAct);          // funcListCurrent(myCards: snapshot.data!.data);
        //    })),

       FutureBuilder<CurrentActivCardModel>(
                future:futureAlbum,
          builder:(context,snapshot){
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ?
          //   Text("${snapshot.data!.data}")
           funcListCurrent(myCards: snapshot.data!.data)
         
              :new Center(child:new CircularProgressIndicator(), //Text("Not found Current Activities"), //new CircularProgressIndicator(),
              );
          }
          ),


////////////////////////////////////




      //  Obx((() {
      //          if(pastcontroller.isLoding.isTrue){
      //               return Center(
      //                        child: CircularProgressIndicator(),
      //                          );
      //                               }
      //          return funcListPast(myCards: pastcontroller.dataPastAct);
      //      })),
      FutureBuilder<PastActivCardModel>(
                future:futureAlbumPast,
          builder:(context,snapshot){
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ?
          //   Text("${snapshot.data!.data}")
   funcListPast(myCards: snapshot.data!.data)
        
              :new Center(child: new CircularProgressIndicator(),      //Text("Not found Current Activities"), //new CircularProgressIndicator(),
              );
          }
          ),


/////////////////////////////////////
            
            ],  
          ),  
        ),  
      ),  
    );  
  }
 
}  




















