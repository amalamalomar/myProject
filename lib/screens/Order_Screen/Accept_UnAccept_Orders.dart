
import 'dart:convert';


import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:charityapp/screens/Order_Screen/Accepted_orders.dart';
import 'package:charityapp/screens/Order_Screen/UnAcceptable_Order.dart';
import 'package:flutter/material.dart';  
 import 'package:http/http.dart' as http;

  
void main() => runApp(Accept_UnAccept_Orders());  


class Accept_UnAccept_Orders extends StatefulWidget {
  Accept_UnAccept_Orders({Key? key}) : super(key: key);
  
  @override
  State<Accept_UnAccept_Orders> createState() => _Accept_UnAccept_Orders();
  

}


class _Accept_UnAccept_Orders extends State<Accept_UnAccept_Orders>{
  
//class MyApp extends StatefulWidget {  
  int index=0;
 
 

     Future<CurrentActivCardModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://charity-appp.000webhostapp.com/api/activities/0'));

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
      .get(Uri.parse('https://charity-appp.000webhostapp.com/api/activities/0'));

  if (response.statusCode == 200) {
    
    return PastActivCardModel.fromJson(jsonDecode(response.body));
  } else {
   
    
    throw Exception('Failed to load previous Activities');
  }
}     

 late Future<PastActivCardModel> futureAlbumPast;


  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
          debugShowCheckedModeBanner: false,

      home: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          appBar: AppBar(  
               title:  Text('Accept & UnAccept Orders'),
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
                Tab(icon: Icon(Icons.contacts), text: "الطلبات المقبولة")  ,
                Tab(icon: Icon(Icons.contacts), text: "الطلبات المرفوضة",),  

              ],  
            ),  
          ),  
    drawer: Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children:[
          const  DrawerHeader(
            decoration:BoxDecoration(
            color: Color.fromARGB(255, 13, 71, 119),
            ),
            child:Text('Drawer Header'),
          ),
      ListTile(
             title: Text('Setting'),
             leading: Icon(Icons.settings,color: Color.fromARGB(255,173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('تبرع'),
             leading: Icon(Icons.money,color: Color.fromARGB(255, 173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                ListTile(
             title: Text('تطوع'),
             leading: Icon(Icons.volunteer_activism,color: Color.fromARGB(255, 173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),

                 ListTile(
             title: Text('استفادة'),
             leading: Icon(Icons.event_available_sharp,color: Color.fromARGB(255, 173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('قائمة الطلبات'),
             leading: Icon(Icons.credit_card_sharp,color: Color.fromARGB(255, 173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('قائمة الطلبات المقبولة و المرفوضة'),
             leading: Icon(Icons.business,color: Color.fromARGB(255, 173, 140, 22),),
             onTap: (){
               Navigator.pop(context);
               },
           ),
        ],
      ),
    ),

          body: TabBarView(  
            children: [  

               FutureBuilder<CurrentActivCardModel>(
                   future:futureAlbum,
             builder:(context,snapshot){
                 if(snapshot.hasError)
                   print(snapshot.error);
                 return snapshot.hasData ?
             //   Text("${snapshot.data!.data}")
              ListAcceptOrder(myCards: snapshot.data!.data)
            
                 :new Center(child:new CircularProgressIndicator(), //Text("Not found Current Activities"), //new CircularProgressIndicator(),
                 );
             }
             ), 
////////////////////////////////////
     FutureBuilder<PastActivCardModel>(
                future:futureAlbumPast,
          builder:(context,snapshot){
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ? ListUnAcceptOrder( myCards: snapshot.data!.data)
              :new Center(child: new CircularProgressIndicator(),
              ); 
          } ,
          ),


            ],  
          ),  
        ),  
      ),  
    );  
  }
 
}  

















