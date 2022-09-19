import 'package:charityapp/configuration/secure_storage.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:charityapp/screens/waghaalmostakdem1.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreeencharity extends StatefulWidget {
   
  SplashScreeencharity({Key? key}) : super(key: key);


  
  @override
  State<SplashScreeencharity> createState() => _SplashScreeen();
  

}
class _SplashScreeen extends State<SplashScreeencharity> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 8),
  
             ()=>token==null?Get.toNamed('/login') : Get.toNamed('/UserInterface'),
          // ()=>Navigator.pushReplacement(context,
          //                               MaterialPageRoute(builder:
          //                                                 (context) => 
          //                                                 UserInterface()
          //                                                ),
          //                              ),
         );
  }


  SecureStorage secureStorage= new SecureStorage();
var token;

  // @override
  // void initState()  {
   
  //   super.initState();
  
  // }
  bool isFirstDependency=true;

  @override
  void didChangeDependencies() {
    if (isFirstDependency){
      isFirstDependency=false;
      testToken();
    }
    super.didChangeDependencies();
  }

   Future<void> testToken()async
   {
      token= await secureStorage.readToken('token');
     // token==null?Get.toNamed('/login') : Get.toNamed('/UserInterface');
   }

           


  @override
  Widget build(BuildContext context) {
   
             // print("token is $token");
                  return  Container(
                    alignment: Alignment.center,
                   // padding: Alignment.,
                    decoration: BoxDecoration(
                  //   border: Border.all(width: 4,color:Color.fromARGB(255, 50, 52, 154) ),
                      ),
                    child:Column(
                      children: [
                 
               SizedBox(height: 1,),

              Image.network(
                           'https://as2.ftcdn.net/v2/jpg/02/99/06/99/1000_F_299069957_9FfNrl3vi6yDSnvEgL6xXRVSYVb0PKkO.jpg',
                           fit: BoxFit.cover,
                           height: 300,
                         ), 
              SizedBox(height: 48,),
               
                Text(
                     ' * Welcome To Our Charity * ',
                     style: new TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.0,
                         color: Color.fromARGB(255, 50, 52, 154)),
                   ),
SizedBox(height: 58,),

               CircularProgressIndicator(
               
                color:Color.fromARGB(255, 50, 52, 154) ,
              
               ),


                      ],
                    ),
            );
                  
  }
}


/*
class _SplashScreeen extends State<SplashScreeencharity>{


  SecureStorage secureStorage= new SecureStorage();
var token;

  @override
  void initState()  {
   
    super.initState();
  
  }
  bool isFirstDependency=true;

  @override
  void didChangeDependencies() {
    if (isFirstDependency){
      isFirstDependency=false;
      testToken();
    }
    super.didChangeDependencies();
  }

   Future<void> testToken()async
   {
      token= await secureStorage.readToken('token');
      token==null?Get.toNamed('/login') : Get.toNamed('/UserInterface');
   }

           
             @override
             Widget build(BuildContext context) {
              
             // print("token is $token");
                  return  Container(
                    alignment: Alignment.center,
                   // padding: Alignment.,
                    decoration: BoxDecoration(
                  //   border: Border.all(width: 4,color:Color.fromARGB(255, 50, 52, 154) ),
                      ),
                    child:Column(
                      children: [
                 
               SizedBox(height: 1,),

              Image.network(
                           'https://as2.ftcdn.net/v2/jpg/02/99/06/99/1000_F_299069957_9FfNrl3vi6yDSnvEgL6xXRVSYVb0PKkO.jpg',
                           fit: BoxFit.cover,
                           height: 300,
                         ), 
              SizedBox(height: 48,),
               
                Text(
                     ' * Welcome To Our Charity * ',
                     style: new TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.0,
                         color: Color.fromARGB(255, 50, 52, 154)),
                   ),
SizedBox(height: 58,),

               CircularProgressIndicator(
               
                color:Color.fromARGB(255, 50, 52, 154) ,
              
               ),


                      ],
                    ),
                    
    //                  SplashScreen(
    //                seconds: 8,
    //               loaderColor: Color.fromARGB(255, 50, 52, 154),

    //  navigateAfterSeconds:  Get.toNamed('/UserInterface'),///////


    //                title: new Text(
    //                  ' * Welcome To Our Charity * ',
    //                  style: new TextStyle(
    //                      fontWeight: FontWeight.bold,
    //                      fontSize: 19.0,
    //                      color: Color.fromARGB(255, 50, 52, 154)),
    //                ),
    //                image:// Image.asset('lib/assets/logo-Box.jpg') ,
    //                Image.network(
    //                        'https://as2.ftcdn.net/v2/jpg/02/99/06/99/1000_F_299069957_9FfNrl3vi6yDSnvEgL6xXRVSYVb0PKkO.jpg',
    //                        fit: BoxFit.cover,
    //                      ),  
    //                    photoSize:175.0,// 100.0,        
    //               backgroundColor: Colors.white,
    //                styleTextUnderTheLoader: new TextStyle(),
  
    //               // loaderColor: Colors.white
    //                ),
          
          
            );
                  
         }
  }

*/