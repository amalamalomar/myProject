
import 'dart:convert';
import 'dart:io';
import 'package:charityapp/controller/model_Login.dart';
import 'package:charityapp/controller/model_Register.dart';
import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:charityapp/screens/home_page/homeScreen.dart';
import 'package:charityapp/screens/log_in/login.dart';
import 'package:charityapp/screens/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  

  @override
  State<UserInterface> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UserInterface> {
int index_MyHomePageState=0;
static int index=0;

  @override
  Widget build(BuildContext context) {
    
final pages=[

HomeScreen(),
LoginScreen(),
RegisterScreen(),

];

    Size size =MediaQuery.of(context).size;
    return Scaffold(
   
   bottomNavigationBar:NavigationBar(
    selectedIndex: index_MyHomePageState,
    onDestinationSelected: (index) => setState(()=>this.index_MyHomePageState=index),
    height:60,
     destinations:[

      
   NavigationDestination(
        icon:Icon(Icons.home,color: Color.fromARGB(255, 16, 15, 113),),
     selectedIcon:Icon(Icons.home,color: Color.fromARGB(255, 173, 140, 22),),
        label:'Home',
  
         ),
  
NavigationDestination(
  icon:Icon(Icons.login,color: Color.fromARGB(255, 16, 15, 113),),
  selectedIcon:Icon(Icons.login,color: Color.fromARGB(255, 173, 140, 22),),
 label:'login',
  
  ),

  NavigationDestination(
  icon:Icon(Icons.logout,color: Color.fromARGB(255, 16, 15, 113),),
  selectedIcon:Icon(Icons.logout,color: Color.fromARGB(255, 173, 140, 22),),
  label:'register',
 
  ),

  ],
  ),


  
  body:pages[index_MyHomePageState],
  
  
       );
  }

}


