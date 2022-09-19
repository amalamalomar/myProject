import 'dart:convert';


import 'package:charityapp/component/const.dart';
import 'package:charityapp/configuration/api.dart';
import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:charityapp/controller/model_order_menu.dart';
import 'package:charityapp/screens/Activity_Screen/add_activity/Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/current_activity/Current_Activities.dart';
import 'package:charityapp/screens/Order_Screen/add_order/Add_Order.dart';
import 'package:charityapp/screens/Order_Screen/order_menu/order_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderMenu extends StatefulWidget {
   
  OrderMenu({Key? key}) : super(key: key);

get l=> _OrderMenu().fff;

 // get fff => l;
  
  @override
  State<OrderMenu> createState() => _OrderMenu();
  

}


class _OrderMenu extends State<OrderMenu>{


   Future<OrderMenuCardModel> fetchdata() async {
  final response = await http
      .get(Uri.parse( baseUrl + '/auth/3/needs'));

  if (response.statusCode == 200) {
    
    return OrderMenuCardModel.fromJson(json.decode(response.body));//jsonDecode(response.body));
  } else {
   
    throw Exception('Failed to load OrderMenu');
  }
}     

//AddActivityModel listMode = AddActivityModel(data: [], message: '', status: 201);
  late Future<OrderMenuCardModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    // listMode.data = <Data>[];
    futureAlbum =fetchdata();
  }

 OrderMenuController controllerOrder=new OrderMenuController();
  
   var fff;
int index=0;
  @override

  
  Widget build(BuildContext context) { 
    
     fff=
    //  Obx(() {
    //    if(controllerOrder.isLoding.isTrue){
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //    }
    //    return funcListCurrent(myCards: controllerOrder.dataOrderMenuList);
    //  });
  
     FutureBuilder<OrderMenuCardModel>(
                future:futureAlbum,
          builder:(context,snapshot){
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ?
          //   Text("${snapshot.data!.data}")
   funcListCurrent(myCards: snapshot.data!.data)
  //      // ///////////////////////  
           
           
        
  //        // /////////////////////////////    
              :new Center(child: new CircularProgressIndicator(),
              );
          }
          );



    return Scaffold(
      appBar: AppBar(
       // centerTitle: true,
        title: Text(
          "OrderMenu",
          style: TextStyle(
            fontFamily: "Poppins",
          //  color: ,
          ),
        ),
      shadowColor: Colors.amber,
      backgroundColor:Color.fromARGB(255, 16, 14, 85),

        actions: [
          IconButton(
              icon: Icon(
                Icons.add,//notifications_active_outlined,
                color: Color.fromARGB(255, 243, 245, 246),
                size: 27,
              ),
              onPressed: () {
          Navigator.of(context).push(
                         MaterialPageRoute(                  // MycardCurentActivty() ,
                           builder:(BuildContext context)=> AddOrder(),
                            ),                            //MycardCurentActivty(Activity:myCards[index]) ,
                       );

              })
        ],
      ),


 drawer:Drawerfunc(),
 
      body:fff,//CurrentActivities().listview ,
    
           );
  }
}

///////////////////


class funcListCurrent extends StatelessWidget{
  List myCards=[];
  funcListCurrent({required this.myCards});

  
  @override
  Widget build(BuildContext context) {

Size size=MediaQuery.of(context).size;
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
                  ////////////////////
                  width: size.width,
                  //////////////////////
                            decoration: BoxDecoration(
                            //color: Color.fromARGB(255, 96, 116, 204),
                           borderRadius: BorderRadius.circular(25),
                           ////////////////////////////
                           border: Border.all(
                          // color: Color.fromARGB(255, 108, 167, 182),
                            color:Color.fromARGB(255, 16, 14, 85),
                            width: 8),
                           boxShadow: [
                            BoxShadow(
                            //  color: Color.fromARGB(255, 108, 167, 182),
                            color:Color.fromARGB(255, 72, 222, 233),
                              offset: Offset(-4,-4),
                            ),
                           ],
                           color: Colors.white,
                           gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                             colors: [
                              Color.fromARGB(255, 17, 9, 108),
                             // Color.fromARGB(255, 141, 136, 195),
                          //    Color.fromARGB(255, 21, 142, 180),
                         //   Color.fromARGB(255, 16, 14, 85),
                           //   Colors.blue,
                           //    Color.fromARGB(255, 228, 183, 225),
                           //   Color.fromARGB(255, 196, 198, 230),
                              Colors.blue,
                         //     Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 255, 255, 255),
                          Colors.white,
                            Colors.white,
                            ],
                            // colors: [
                            //   Color.fromARGB(255, 233, 130, 240),
                            //   Color.fromARGB(255, 149, 70, 188),
                            //   Color.fromARGB(255, 172, 61, 209),
                            //   Color.fromARGB(255, 111, 7, 92),
                            // ],
                           ),
                           ////////////////
                     ),
                     
                       child:
                        Column(
                        //    mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                SizedBox(height: 10,),
     
                          Container(
                            height: 170,
                            width: size.width,
                          //  width: 380,
                         decoration: BoxDecoration(
                         //   color: Color.fromARGB(255, 88, 171, 219),
                           borderRadius: BorderRadius.circular(20),
                     ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                      //  mainAxisAlignment: MainAxisAlignment.start,
     
                                children: [
                        SizedBox(height: 7,),

        //Padding(padding: EdgeInsets.all(10)),         
     RichText(text: 
     TextSpan(
text:"title   ",
                       style:TextStyle(fontWeight:FontWeight.bold,
                     color:Colors.blue,//Color.fromARGB(255, 16, 14, 85),
                       fontSize: 17
                       ),


   children:<TextSpan>[
       TextSpan(
     text:":  ${myCards[i]['title'].toString() }",
                       style:TextStyle(fontWeight:FontWeight.bold,
                       color:Color.fromARGB(255, 16, 14, 85),
                       fontSize: 17
                       ),
                       
     ),
     ],         
     ),

 
     ),
       
Padding(padding: EdgeInsets.all(10)),

        RichText(text: 
     TextSpan(
      text:"Cost   ",
                       style:TextStyle(fontWeight:FontWeight.bold,
                       color:Colors.blue,
                       fontSize: 17
                       ),


   children:<TextSpan>[
       TextSpan(
        
     text:" :   ${myCards[i]['cost'].toString()}",
                                style:TextStyle(
                                  fontWeight:FontWeight.bold,
                                color: Color.fromARGB(255, 16, 14, 85),
                                 fontSize: 17
                                 ),
                       
     ),
     ],         
     ),

 
     ),

            Padding(padding: EdgeInsets.all(10)),         
              
                 RichText(text: 
     TextSpan(
text:  "    description",
                       style:TextStyle(fontWeight:FontWeight.bold,
                color:Colors.blue,
                        fontSize: 17
                       ),


   children:<TextSpan>[
       TextSpan(
     text:" :    ${myCards[i]['description'].toString()}",
                                style:TextStyle(fontWeight:FontWeight.bold,
                                color:Color.fromARGB(255, 16, 14, 85),
                                 fontSize: 17
                                ),
                       
     ),
     ],         
     ),

 
     ),
           
             Padding(padding: EdgeInsets.all(10)),        
      
                          ],
                          ),
                              ],
                            )
                          ,),
                            //   MycardCurentActivty(
                        
                            //   Activity: myCards[index]('data'),
                            // ),
                        
                           Padding(padding: EdgeInsets.only(top: 7)),
                       //     SizedBox(height: 40,),
                                    Column(
                                      children: 
                                      [ 
                                       Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                                                    
                                        children: [
                      
                             InkWell(
                              splashColor: Colors.amber,
                                  onTap : (){
 
                                  print("ff");
                                 },
                                
                               child: Container(
                               
                                     alignment: Alignment.center,                    
                                height: 40,
                                width: 40,
                                
                                decoration: BoxDecoration(
                                  
                                  border: Border.all(color:Color.fromARGB(255, 16, 14, 85),width: 2 ),
                                 borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                      // colors: [
                                      // Color.fromARGB(255, 2, 22, 78),
                                      // Color.fromARGB(255, 2, 60, 92),
                                      // Color.fromARGB(255, 83, 85, 189),
                                      // Color.fromARGB(255, 89, 98, 137),
                                      // ],
                                    colors: [
                                      Color.fromARGB(255, 6, 39, 130),
                                      Color.fromARGB(255, 28, 142, 203),
                                      Color.fromARGB(255, 116, 218, 238),
                                      Color.fromARGB(255, 89, 98, 137),
                                      ],
                                  ),
                                ),
                                 child: Text("قبول",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 86, 12, 78),
                                    // color: Color.fromARGB(255, 16, 14, 85)
                                    ),
                                                                      ),
                               ),
                             ),
                   

                                                 SizedBox(width: 40,),


                                                          InkWell(
                              splashColor: Colors.amber,
                                  onTap : (){
 
                                  print("ff");
                                 },
                                
                               child: Container(
                               
                                     alignment: Alignment.center,                    
                                height: 40,
                                width: 40,
                                
                                decoration: BoxDecoration(
                                  
                                  border: Border.all(color:Color.fromARGB(255, 16, 14, 85),width: 2 ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 6, 39, 130),
                                      Color.fromARGB(255, 28, 142, 203),
                                      Color.fromARGB(255, 116, 218, 238),
                                      Color.fromARGB(255, 89, 98, 137),
                                      ],
                                  ),
                                ),
                                 child: Text("رفض",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 16, 14, 85)),
                                                                      ),
                               ),
                             ),
                                       
                                      SizedBox(width: 30,),                              
                                        ],
                                      ),
                                   ]
                                    ),
                                 
               
               
                                 
                            
                            ],
                          ),
                        ),
     
     SizedBox(height: 20,),
       
     // Padding(padding: EdgeInsets.all(90)),
     //             Row(
     //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            
     //               children: [
     //      RaisedButton(
     //          padding: EdgeInsets.all(25),
     //          shape: RoundedRectangleBorder(
     //            borderRadius: BorderRadius.all(Radius.circular(20),),
     //            ),
     //          child:Text("Add Card",style: TextStyle(
     //         fontSize: 15,
     //         fontWeight: FontWeight.bold,
     //          color: Colors.white),
     //         ),
     //         color: Color.fromARGB(255, 16, 14, 85),
     //          onPressed: (){
     //            Navigator.of(context).push(
     //                     MaterialPageRoute(                  // MycardCurentActivty() ,
     //                       builder:(BuildContext context)=> AddCurrentActivity(),
     //                        ),                            //MycardCurentActivty(Activity:myCards[index]) ,
     //                   );
     //          },
     //          ),
                
     //               ],
     //             ),
         
              ],
              
             
             ////////**////////
             
               );
             
                   
         }
         
         
         );



////////** */



  }

}



    





            




  