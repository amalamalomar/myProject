import 'dart:convert';

import 'package:charityapp/controller/model_Add_Activity.dart';
import 'package:charityapp/controller/model_Add_Order.dart';
import 'package:charityapp/screens/Order_Screen/order_menu/Order_Menu.dart';
import 'package:charityapp/screens/Order_Screen/add_order/add_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class AddOrder extends StatefulWidget{
  
  const AddOrder({ Key ?key}):super(key: key);
  @override
  State<AddOrder> createState() =>_AddOrder();

}

class _AddOrder extends State<AddOrder>{
 // DatabaseHelper databaseHelper=new DatabaseHelper();

// Future<AddActivityModel> addOrder(DataOrder data,) async {
//   final http.Response response = await http.post(
//     'url',
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       "data": data.toJson()
//     }),
//   );
//   if (response.statusCode == 201) {
//     return AddActivityModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

/*
Future<AddOrderModel>? _futureAlbum;

Future<AddOrderModel> addOrder(dynamic _User_NameController,dynamic _Date_OrderController,dynamic _Type_DateController) async {
  final response = await http.post(
    Uri.parse('https://charity-appp.000webhostapp.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
        "userName": _User_NameController,
        "dateType":_Date_OrderController,
       "typeOrder": _Type_DateController,
    }),
  );

  if (response.statusCode == 200) {
  
    return AddOrderModel.fromJson(jsonDecode(response.body)["user"]);
  } else {
  
    throw Exception('Failed to create album.');
  }
}

*/
AddOrderController controller=new AddOrderController();

void addOrder(int id) async{
  
      EasyLoading.show(status: 'is loading.....');
      await controller.addOrder(_User_NameController.text.trim(),
       _Date_OrderController.text.trim(), _Type_DateController.text.trim(),id);
      if(controller.addOrderStatus)
      {
        EasyLoading.showSuccess('add Order success');
        Get.toNamed('/OrderMenu');
      }
      else{
        EasyLoading.showError('error!');
      }
    }


_onPressed(){
addOrder(id);
//         setState((){
//       if(_User_NameController.text.trim().isNotEmpty &&
//        _Date_OrderController.text.trim().isNotEmpty && _Type_DateController.text.isNotEmpty){

//  addOrder(_User_NameController.text.trim(), _Date_OrderController.text.trim(),
//   _Type_DateController.text.trim()).whenComplete(
    
//     ()=>Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder:(BuildContext context)=> OrderMenu(),
//                        ),
//    )

//   );
// }else{
// _showDialog();
//   // msgStatus='check email or password' ;
// }
//   });
                 
                 
                 
                 
                  }


_showDialog(){
  showDialog(
    context: context,
  builder:(BuildContext context ){
    return AlertDialog(
      title: Text('Failed'),
      content: Text('check your Name or dateType or typeOrder'),
      actions: <Widget>[
          RaisedButton(
                  child: Text('AddOrder'),
                  onPressed:(){
                    Navigator.of(context).pop();
                  },

                    ),
      ],
    );
  }
  );
}

    final TextEditingController _User_NameController=new TextEditingController();
  final TextEditingController _Date_OrderController=new TextEditingController();
 final TextEditingController _Type_DateController=new TextEditingController();

 late int id;
   @override
  Widget build(BuildContext context) {
  //  throw UnimplementedError();
    return MaterialApp(
          debugShowCheckedModeBanner: false,
      title: 'Add Order',
      color:Color.fromARGB(255, 16, 14, 85),
      home: Scaffold(
        appBar: AppBar(
              title: Text('Add Order'),
     backgroundColor:Color.fromARGB(255, 16, 14, 85),
        ),
      
        body: Container(
child: ListView(
  
             padding: EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
             children:<Widget> [
              SizedBox(height: 30,),
               Container(
                  height: 50,
                  child: TextField(
                   controller: _User_NameController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('User Name'),
                     hintText:' Enter Your Name',
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                    /// icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                         borderSide: const BorderSide(color: Color.fromARGB(255, 16, 14, 85),),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 14, 85),
                          width: 1,
                        ),
                      ),
                    // icon: Icon(Icons.blur_on),
                   ),
                    ),
               ),
               SizedBox(height: 25,),
                Container(
                  height: 50,
                  child: TextField(
                   controller: _Date_OrderController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('date of Order'),
                     hintText:'Enter date of Order',
                      prefixIcon: Icon(
                        Icons.dataset,
                      ),
                     
                    // icon: Icon(Icons.dataset),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                         borderSide: const BorderSide(color: Color.fromARGB(255, 16, 14, 85),),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 14, 85),
                          width: 1,
                        ),
                      ),
                   ),
                    ),
               ),
                SizedBox(height: 25,),
                Container(
                  height: 50,
                  child: TextField(
                   controller: _Type_DateController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('Type Order'),
                     hintText:'Enter Type Order',
                     prefixIcon: Icon(
                        Icons.type_specimen,
                      ),
                   //  icon: Icon(Icons.type_specimen),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                         borderSide: const BorderSide(color: Color.fromARGB(255, 16, 14, 85),),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 14, 85),
                          width: 1,
                        ),
                      ),
                   ),
                    ),
               ),
                
                   Padding(padding: EdgeInsets.only(top: 70.0),),
                   SizedBox(height: 20,),
                     Center(
                 // height: 50,
                  child:Material(
                         color: Color.fromARGB(255, 30, 12, 87),
                        elevation :10,
                        borderRadius:BorderRadius.circular(30),
                        //width: 150,
                     
                        child: MaterialButton(

                           onPressed: (){
                          _onPressed();
                          },
                           height: 60,
                   minWidth: double.infinity,
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
               ),
                  Padding(padding: EdgeInsets.only(top: 44.0),),

             ],
            ),          
  
          ),
        ),
    );
  }

}









