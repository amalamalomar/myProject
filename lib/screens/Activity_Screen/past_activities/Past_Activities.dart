import 'dart:convert';
import 'package:charityapp/component/const.dart';
import 'package:charityapp/controller/modelPastActivities.dart';
import 'package:charityapp/screens/Activity_Screen/add_activity/Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/past_activities/past_activities_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PastActivities extends StatefulWidget {

  PastActivitiesController pastcontroller=new PastActivitiesController();
   
  PastActivities({Key? key}) : super(key: key);

get l=> _PastActivities().fff;

 // get fff => l;
  
  @override
  State<PastActivities> createState() => _PastActivities();
  

}


class _PastActivities extends State<PastActivities>{


   Future<PastActivCardModel> fetchdata() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:8000/api/activities/1'));

  if (response.statusCode == 200) {
    
    return PastActivCardModel.fromJson(json.decode(response.body));//jsonDecode(response.body));
  } else {
   
    throw Exception('Failed to load Current Activities');
  }
}     

// //AddActivityModel listMode = AddActivityModel(data: [], message: '', status: 201);
  late Future<PastActivCardModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    // listMode.data = <Data>[];
    futureAlbum =fetchdata();
  }

 
  
   var fff;
int index=0;
  @override

  
  Widget build(BuildContext context) { 
    
     fff=
//      Obx((() {
//         if(pastcontroller.isLoding.isTrue){
// return Center(
//   child: CircularProgressIndicator(),
// );
//     }
//     return funcListPast(myCards: pastcontroller.dataPastAct);
//      }));



     FutureBuilder<PastActivCardModel>(
                future:futureAlbum,
          builder:(context,snapshot){
              if(snapshot.hasError)
                print(snapshot.error);
              return snapshot.hasData ?
          //   Text("${snapshot.data!.data}")
   funcListPast(myCards: snapshot.data!.data)
       // ///////////////////////  
           
           
        
         // /////////////////////////////    
              :new Center(child: new CircularProgressIndicator(),      //Text("Not found Current Activities"), //new CircularProgressIndicator(),
              );
          }
          );



    return Scaffold(
      appBar: AppBar(
       // centerTitle: true,
        title: Text(
          "Past Activities",
          style: TextStyle(
            fontFamily: "Poppins",
          //  color: ,
          ),
        ),
      shadowColor: Colors.amber,
      backgroundColor:Color.fromARGB(255, 16, 14, 85),

      ),


 drawer: Drawerfunc(),
 
      body:fff,//CurrentActivities().listview ,
    
           );
  }
}

///////////////////


class funcListPast extends StatelessWidget{
  List myCards=[];
  funcListPast({required this.myCards});
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
                            Color.fromARGB(255, 16, 14, 85),
                              Colors.blue,
                              Color.fromARGB(255, 235, 225, 234),
                            Colors.white
                            ],
                          
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

        RichText(
          text: TextSpan(
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
           
    //          Padding(padding: EdgeInsets.all(10)),        
    //      RichText(text: 
    //            TextSpan(
    //              text:"charity_id    ",
    //                    style:TextStyle(fontWeight:FontWeight.bold,
    //                    color:Colors.blue,
    //                    fontSize: 17
    //                    ),


    //            children:<TextSpan>[
    //    TextSpan(
    //  text:" :    ${myCards[i]['charity_id'].toString()}",
    //                              style:TextStyle(fontWeight:FontWeight.bold,
    //                              color: Color.fromARGB(255, 16, 14, 85),
    //                               fontSize: 17
    //                               ),
                       
    //  ),
    //  ],         
    //  ),

 
    //  ),
                     
             
                          
                           
     
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
                                 child: Text("تبرع",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 86, 12, 78),
                                    // color: Color.fromARGB(255, 16, 14, 85)
                                    ),
                                                                      ),
                               ),
                             ),
                   

                                                 SizedBox(width: 12,),


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
                                 child: Text("استفادة",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 16, 14, 85)),
                                                                      ),
                               ),
                             ),
                   

                                                 SizedBox(width: 12,),


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
                                 child: Text("تطوع",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 16, 14, 85)),
                                                                      ),
                               ),
                             ),
                   



                                                 SizedBox(width: 12,),


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
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color:Color.fromARGB(255, 16, 14, 85),width: 2 ),
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
                                 child: Text("حذف",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 16, 14, 85)),
                                                                      ),
                               ),
                             ),
                             
                   

              //                                                RaisedButton(
              //                                             padding: EdgeInsets.all(25),
              //                                             shape: RoundedRectangleBorder(
              //                                               borderRadius: BorderRadius.all(Radius.circular(100),),
              //                                               ),
              //                                             child:Text("حذف ",style: TextStyle(
              //                                            fontSize: 10,
              //                                            fontWeight: FontWeight.bold,
              //                                             color: Color.fromARGB(255, 16, 14, 85)),
              //                                            ),
              //                                            color: Colors.white,
              //                                            onPressed:(){
                                                            
                                                             
              //                              deleteData(myCards[i]);
                                                              
                                                               
              //  //deleteData(widget.list[widget.index]['id']);
              // deleteData(myCards[i]);
              //       Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder:(BuildContext context)=> CurrentActivities(),
              //          ), 
              //          );
                  
              //                                            }
              //                                             ),

                               SizedBox(width: 12,),

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
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color:Color.fromARGB(255, 16, 14, 85),width: 2 ),
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
                                 child: Text("تعديل",style: TextStyle(
                                    fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 16, 14, 85)),
                                                                      ),
                               ),
                             ),
                   
                         SizedBox(width: 12,),

  
  
  
  
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
                                   ]
                                    ),
                                 
               
               
                                 
                            
                            ],
                          ),
                        ),
     
     SizedBox(height: 10,),
       
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



    





            




  