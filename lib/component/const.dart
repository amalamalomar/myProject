

import 'package:charityapp/configuration/secure_storage.dart';
import 'package:charityapp/screens/waghaalmostakdem1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Drawerfunc extends StatelessWidget{
SecureStorage secureStorage=new SecureStorage();
  @override
  Widget build(BuildContext context) {
   
   return Drawer(
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
             leading: Icon(Icons.settings,color: Colors.blue,),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('تبرع'),
             leading: Icon(Icons.money,color: Colors.blue,),
             onTap: (){
               Navigator.pop(context);
               },
           ),
                ListTile(
             title: Text('تطوع'),
             leading: Icon(Icons.volunteer_activism,color: Colors.blue,),
             onTap: (){
            //  Get.toNamed('/OrderMenu');
               Navigator.pop(context);
               },
           ),

                 ListTile(
             title: Text('استفادة'),
             leading: Icon(Icons.event_available_sharp,color: Colors.blue,),
             onTap: (){
             //  Get.toNamed('/OrderMenu');
               Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('قائمة الطلبات'),
             leading: Icon(Icons.credit_card_sharp,color: Colors.blue,),
             onTap: (){
              Get.toNamed('/OrderMenu');
              // Navigator.pop(context);
               },
           ),
                  ListTile(
             title: Text('قائمة الأنشطة السابقة و الحالية'),
             leading: Icon(Icons.credit_card_sharp,color: Colors.blue,),
             onTap: (){
              Get.toNamed('/Cur_Pas_Activities');
              // Navigator.pop(context);
               },
           ),
               ListTile(
             title: Text('Profile'),
             leading: Icon(Icons.person,color: Colors.blue,),
             onTap: (){
                // Navigator.of(context).push(
                //          MaterialPageRoute(                  // MycardCurentActivty() ,
                //            builder:(BuildContext context)=> UserInterface(),
                //             ),                            //MycardCurentActivty(Activity:myCards[index]) ,
                //        );
             // Get.toNamed('/UserInterface');
             //  Navigator.pop(context);
               },
           ),
                 ListTile(
             title: Text('واجهة المستخدم'),
             leading: Icon(Icons.business,color: Colors.blue,),
             onTap: (){
                Navigator.of(context).push(
                         MaterialPageRoute(                  // MycardCurentActivty() ,
                           builder:(BuildContext context)=> UserInterface(),
                            ),                            //MycardCurentActivty(Activity:myCards[index]) ,
                       );
             // Get.toNamed('/UserInterface');
             //  Navigator.pop(context);
               },
           ),
               ListTile(
             title: Text('LogOut'),
             leading: Icon(Icons.logout_outlined,color: Colors.blue,),
             onTap: ()async{
                       await secureStorage.deleteToken('token');
                        EasyLoading.showSuccess('logOut is done!');
               Get.toNamed('/login');
              
               
              //   Navigator.of(context).push(
              //            MaterialPageRoute(                  // MycardCurentActivty() ,
              //              builder:(BuildContext context)=> UserInterface(),
              //               ),                            //MycardCurentActivty(Activity:myCards[index]) ,
              //          );
             // Get.toNamed('/UserInterface');
             //  Navigator.pop(context);
               },
           ),
      
        ],
      ),
    );

  }




}