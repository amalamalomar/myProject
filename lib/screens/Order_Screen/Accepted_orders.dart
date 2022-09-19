
import 'dart:convert';
import 'package:charityapp/controller/modelCurrentActivities.dart';
import 'package:flutter/material.dart';  
 import 'package:http/http.dart' as http;


class AcceptedOrder extends StatefulWidget {
  AcceptedOrder({Key? key}) : super(key: key);
  
  @override
  State<AcceptedOrder> createState() => _AcceptedOrder();
  
}

class _AcceptedOrder extends State<AcceptedOrder>{
  
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
     

  }



  

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
          debugShowCheckedModeBanner: false,

      home: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          appBar: AppBar(  
               title:  Text('AcceptedOrder'),
              backgroundColor:  Color.fromARGB(255, 16, 14, 85),
          
        
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

          body: FutureBuilder<CurrentActivCardModel>(
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
        ),  
      ),  
    );  
  }
 
}  


///////////

class ListAcceptOrder extends StatelessWidget{
  List myCards=[];
  ListAcceptOrder({required this.myCards});
  @override
  Widget build(BuildContext context) {
//    throw UnimplementedError();
     return 


     ///////////*/
        
        ListView.builder(
        padding:EdgeInsets.all(20),
         itemCount: myCards==null ? 0 : myCards.length,
         

         itemBuilder: (context,i){
     
               return Column(
                mainAxisAlignment: MainAxisAlignment.start,


                ///////**//////
                 children: [    
                   
                     Container(
                  height: 250,
                            decoration: BoxDecoration(
                            color: Color.fromARGB(255, 96, 116, 204),
                           borderRadius: BorderRadius.circular(20),
                     ),
                     
                       child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                SizedBox(height: 10,),
     
                          Container(
                            height: 170,
                            width: 380,
                         decoration: BoxDecoration(
                         //   color: Color.fromARGB(255, 88, 171, 219),
                           borderRadius: BorderRadius.circular(20),
                     ),
                            child: Column(
                                  //  mainAxisAlignment: MainAxisAlignment.start,
     
                            children: [
                        SizedBox(height: 30,),
     
                       Text("title :     ${myCards[i]['title'].toString() }",
                       style:TextStyle(fontWeight:FontWeight.bold,
                       color:Color.fromARGB(255, 16, 14, 85),
                       fontSize: 17
                       )),
                           Padding(padding: EdgeInsets.all(10)),
                            Text("cost :     ${myCards[i]['cost'].toString()}",
                            style:TextStyle(
                              fontWeight:FontWeight.bold,
                            color: Color.fromARGB(255, 16, 14, 85),
                             fontSize: 17
                             )),
     
                           Padding(padding: EdgeInsets.all(10)),
                            Text("description :    ${myCards[i]['description'].toString()}",
                            style:TextStyle(fontWeight:FontWeight.bold,
                            color:Color.fromARGB(255, 16, 14, 85),
                             fontSize: 17
                            )),
                             Padding(padding: EdgeInsets.all(10)),
                             Text("charity_id :    ${myCards[i]['charity_id'].toString()}",
                             style:TextStyle(fontWeight:FontWeight.bold,
                             color: Color.fromARGB(255, 16, 14, 85),
                              fontSize: 17
                              )),
                           
     
                          ],
                          ),
                          ),
                          
                            
                            ],
                          ),
                        ),
     
     SizedBox(height: 10,),
       
   
         
              ],
              
             
             ////////**////////
             
               );
             
                   
         }
         
         
         );




  }

}



























