import 'dart:convert';
import 'package:charityapp/component/const.dart';
import 'package:charityapp/screens/log_in/login.dart';
import 'package:charityapp/screens/waghaalmostakdem1.dart';
import 'package:http/http.dart' as http;
import 'package:charityapp/controller/model_Register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'register_controller.dart';


class RegisterScreen extends StatefulWidget{

  const RegisterScreen({ Key ?key}):super(key: key);
  @override
  _RegisterScreen createState() =>_RegisterScreen();

}




class _RegisterScreen extends State<RegisterScreen>{


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();
var password_Confirmation_Controller=TextEditingController();

RegisterController controller=RegisterController();
//var charityId=TextEditingController();
 void register() async
  {
    EasyLoading.show(status:'loading.....');
   await controller.register(fnameController.text.trim().toString(),
   lnameController.text.trim().toString(),emailController.text.trim().toString(),
   passwordController.text.trim().toString(),
   password_Confirmation_Controller.text.trim().toString(),id );//id.toInt());
if(controller.registerStatus)
{
  print('idrol is ---->$id');
   EasyLoading.showSuccess('sign up is done!');
  Get.toNamed('/login');//Get.toNamed('/login');
}
else
{
EasyLoading.showError('error!');
print('error');
}
  }
  


  String msgStatus="";

_showDialog(){
  showDialog(
    context: context,
  builder:(BuildContext context ){
    return AlertDialog(
      title: Text('Failed'),
      content: Text(' check your name or email or password  or another inputs'),
      actions: <Widget>[
          RaisedButton(
                  child: Text(' Register'),
                  onPressed:(){
                    Navigator.of(context).pop();
                  },

                    ),
      ],
    );
  }
  );
}



_onPrassed(){
 
  if(fnameController.text.trim().isNotEmpty && lnameController.text.trim().isNotEmpty
   &&emailController.text.trim().isNotEmpty&& passwordController.text.trim().isNotEmpty
   && password_Confirmation_Controller.text.trim().isNotEmpty && id ==id &&
   passwordController.text.trim().isNotEmpty == 
   password_Confirmation_Controller.text.trim().isNotEmpty){

 register();

}else{
_showDialog();

}

}



 
  // Initial Selected Value
  String dropdownvalue = 'موظف إدخال';//'نوع المستخدم';  
 
  // List of items in our dropdown menu
  var items = [   
  //  'نوع المستخدم',
    'موظف إدخال',
    'محتاج',
    'متطوع',
    'متبرع',
    
  ];
 late int id;
 bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
                             backgroundColor: Color.fromARGB(255, 6, 22, 72),

      ),
      drawer: Drawerfunc(),


      body: 
      
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

     SizedBox( width: size.width*0.3, ),

          DropdownButton(
               
              // Initial Value
              value: dropdownvalue,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
           //  dropdownColor: Color.fromARGB(255, 3, 27, 68),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  alignment: AlignmentDirectional.centerEnd,
                  value: items,
                  child: Text(items,style:TextStyle(color:Color.fromARGB(255, 3, 27, 68),fontWeight: FontWeight.bold
                 )),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {

                if(newValue=="موظف إدخال"){
                id=1;
                }
                 if(newValue=="محتاج"){
                  id=2;
                }
                 if(newValue=="متطوع"){
                 id=3;
                }
               if(newValue=="متبرع"){
                  id=4;
                }
                print("value is $newValue");
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),


                    ],
                  ),

                  
                  SizedBox(
                    height: 40.0,
                  ),


                  TextFormField(
                    controller: fnameController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? fnameController) {
                      if (fnameController == null || fnameController == '' || fnameController.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if(fnameController.length<2){
                        return 'too short';
                      }
                      if(fnameController.length>20){
                        return 'Invalid';
                      }

                      return null;
                    },

                   
                    decoration: InputDecoration(
                     hintText: 'Enter First Name',
                      labelText: 'First Name',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red,width: 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),



                  TextFormField(
                    controller: lnameController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? lnameController) {
                      if (lnameController == null || lnameController == '' || lnameController.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if(lnameController.length < 2){
                        return 'too short';
                      }
                      if(lnameController.length>20){
                        return 'Invalid';
                      }

                      return null;
                    },
                    
                    decoration: InputDecoration(
                      hintText: "Enter Last Name",
                      labelText: 'Last Name',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red,width: 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),


                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (emailController) {
                        if (emailController == null || emailController == '' || emailController.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if(emailController.length < 6){
                          return 'too short';
                        }
                        if(emailController.contains('@') == false || emailController.contains('.com') == false){
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                
                    decoration: InputDecoration(
                       hintText: ' Enter Email Address',
                      labelText: 'Email Address',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red,width: 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                 
                 
                  SizedBox(
                    height: 40.0,
                  ),

                

/////////////////////
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (passwordController) {
                        if (passwordController == null || passwordController == '' || passwordController.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if(passwordController.length < 8){
                          return 'Invalid';
                        }
                        return null;
                      }, 
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:  _isObscure ,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                                    ),
                       suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 87, 102, 114)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
//////
              SizedBox( height: 40.0, ),


              TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password_Confirmation_Controller) {
                        if (password_Confirmation_Controller == null || password_Confirmation_Controller == '' || password_Confirmation_Controller.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if(password_Confirmation_Controller.length  <  8){
                          return 'Invalid';
                        }
                        return null;
                      }, 
                    controller: password_Confirmation_Controller,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: " Enter password Confirmation",
                      labelText: 'password Confirmation',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                     suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 30.0,),

        Center( 
                    child:
                     Material(
                         color: Color.fromARGB(255, 6, 22, 72),
                        elevation :10,
                        borderRadius:BorderRadius.circular(30),
                        //width: 150,
                     
                        child: MaterialButton(

                           onPressed: (){
                           // register();
                         _onPrassed();
                          },
                           height: 60,
                   minWidth: double.infinity,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),

                  ),

                

                   SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Already Member ?'
                      ),
                      TextButton(
                        onPressed: (){Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:(BuildContext context)=> LoginScreen(),
                       ),
   );},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
   
   
    );
  }


  // _save(String token)async{
  //   final prefs=await SharedPreferences.getInstance();
  //   final key='token';
  //   final value=token;
  //   prefs.setString(key,value);
  // }

}