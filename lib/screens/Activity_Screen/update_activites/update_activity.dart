import 'dart:convert';
import 'package:charityapp/controller/model_Add_Activity.dart';
import 'package:charityapp/screens/Activity_Screen/update_activites/update_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
class EditActivity extends StatefulWidget{
  //List list=[];
   //int index;
 EditActivity();
 
  @override
  EditActivityState createState() =>EditActivityState();

}

class EditActivityState extends State<EditActivity>{
 // DatabaseHelper databaseHelper=new DatabaseHelper();
int id=0;

 
editData( int id,Data data) async {

  final prefs=await SharedPreferences.getInstance();
  final key='token';
  final value=prefs.get(key)?? 0;
String myUrl= "https://charity-appp.000webhostapp.com/api/activities/$id ";
 http.put(myUrl,
headers:{'Accept':'application/json',
       'Authorization':'Bearer $value'
},
body: jsonEncode(<String, dynamic>{
      "data": data.toJson(),
     
    }
    )
//     .then((response){
//   print('Response status :${response.statusCode}');
//     print('Response body :${response.body}');

// } 
);
}


    late TextEditingController _titleController;
        late TextEditingController _costController;
    late TextEditingController _descriptionController;
    UpdateController controller=UpdateController();

    void update(int idActivity) async{
      EasyLoading.show(status: 'is loading.....');
      await controller.updateActivity(_titleController.text.trim(), _costController.text.trim(),
       _descriptionController.text.trim(),idActivity);
      if(controller.updateStatus)
      {
        EasyLoading.showSuccess('update success');
        Get.toNamed('/currentActivites');
      }
      else{
        EasyLoading.showError('error!');
      }
    }
   // late TextEditingController _charityIdController;

  //late TextEditingController _priceController;


  @override
  void initState() {
    // _nameController=new TextEditingController(text: widget.list[widget.index]['name']);
    // _priceController=new TextEditingController(text: widget.list[widget.index]['price']);
    super.initState();
    _titleController=new TextEditingController();
    _costController=new TextEditingController();
    _descriptionController=new TextEditingController();
   // _charityIdController=new TextEditingController();

  }
 late int idActivity;
 
   @override
  Widget build(BuildContext context) {
  //  throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update Current Activity',
      home: Scaffold(
        appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 16, 14, 85),
              title: Text('Update Current Activity'),
            
        ),
        body:
           Container(
           child: ListView(
  
             padding: EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
             children:<Widget> [
              SizedBox( height: 20.0, ),
               Container(
                  height: 50,
                  child: TextField(
                   controller: _titleController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('title'),
                     hintText:'Activity title',
                     icon: Icon(Icons.blur_on),
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
               SizedBox( height: 20.0, ),
                Container(
                  height: 50,
                  child: TextField(
                   controller: _costController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('cost'),
                     hintText:'Activity cost',
                     icon: Icon(Icons.money),
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
               SizedBox( height: 20.0, ),
                Container(
                  height: 50,
                  child: TextField(
                   controller: _descriptionController ,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: Text('description'),
                     hintText:'Activity description',
                     icon: Icon(Icons.border_clear),
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
               SizedBox( height: 40.0, ),
              //     Container(
              //     height: 50,
              //     child: TextField(
              //      controller: _charityIdController ,
              //      keyboardType: TextInputType.number,
              //      decoration: InputDecoration(
              //        label: Text('charityId'),
              //        hintText: 'Activity charityId',
              //        icon: Icon(Icons.vpn_key),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //            borderSide: const BorderSide(color: Color.fromARGB(255, 16, 14, 85),),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           borderSide: const BorderSide(color: Colors.blue),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           borderSide: const BorderSide(
              //             color: Color.fromARGB(255, 16, 14, 85),
              //             width: 1,
              //           ),
              //         ),
              //      ),
              //       ),
              //  ),
                  
                  
                   Padding(padding: EdgeInsets.only(top: 90.0),),
                   


  Center( 
                    child:
                     Material(
                         color: Color.fromARGB(255, 6, 22, 72),
                        elevation :10,
                        borderRadius:BorderRadius.circular(30),
                        //width: 150,
                     
                        child: MaterialButton(

                            onPressed:(){
                            
               if(_titleController.text ==null || _costController.text==null 
                       || _descriptionController.text==null ){
               
                  Center(child: Text(" Error add title or cost or description or charityId"),) ; 
                                    }else{
                          
                      update(idActivity);
                      }
                  },
                  
                           height: 60,
                           minWidth: 230,
               //   minWidth: double.infinity,
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),

                  ),
                 


/////////////////////////////////


//                      Container(
//                   height: 50,
//                   child: RaisedButton(
//                   onPressed:(){
//  setState(() {


/////////////////////////////////////

                  Padding(padding: EdgeInsets.only(top: 44.0),),

             ],
            ),          
  
          ),
      
        

        ),
    );
  }



}






/*

 deleteData(int id) async {
   
   final prefs=await SharedPreferences.getInstance();
    final key='token';
    final value=prefs.get(key)?? 0;
String myUrl= "$serverUrl/products/$id ";
 http.delete(myUrl,
headers:{'Accept':'application/json',
       'Authorization':'Bearer $value'
  },
).then((response){
  print('Response status :${response.statusCode}');
    print('Response body :${response.body}');

} );
}

*/


/*
 Container(
                  height: 50,
                  child: FlatButton(
                  onPressed:(){
                databaseHelper.deleteData(widget.list[widget.index]['id']);

                    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:(BuildContext context)=>const Dashboard(title: '',),
                       ), 
                       );
                  },
                  color: Colors.blue,
                  child: Text('Delete',
                              style: TextStyle(color: Colors.red),
                  
                  
                  ),
                    ),
               ),
               
*/