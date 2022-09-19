import 'dart:convert';
import 'package:charityapp/component/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charityapp/controller/model_Login.dart';
import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:charityapp/screens/register/register.dart';
import 'package:charityapp/screens/waghaalmostakdem1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'log_in_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class LoginScreen extends StatefulWidget{

  const LoginScreen({ Key ?key}):super(key: key);
  @override
  _LoginScreen createState() =>_LoginScreen();

}




class _LoginScreen extends State<LoginScreen>
{

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String msgStatus="";
  LogInController controller=LogInController();



  void logIn() async
  {
    EasyLoading.show(status:'loading.....');
      await controller.logIn(emailController.text.trim(),
            passwordController.text.trim());
       if(controller.logInStatus)
     {
           EasyLoading.showSuccess('log in is done!');
             Get.toNamed('/SplashScreeencharity');
           }
     else
           {
            EasyLoading.showError('password or email not correct!');
            print('error');
             }
  }
Future<LoginModel>? _futureAlbum;
 var status;
var token;
  _save(String token)async{
    final prefs=await SharedPreferences.getInstance();
    final key='token';
    final value=token;
    prefs.setString(key,value);
  }


_showDialog(){
  showDialog(
    context: context,
  builder:(BuildContext context ){
    return AlertDialog(
      title: Text('Failed'),
      content: Text('check your email or password'),
      actions: <Widget>[
          RaisedButton(
                  child: Text('Login'),
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
  setState((){
if(emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty){
  
  
  logIn();
  

}else{
_showDialog();

   msgStatus='check email or password' ;
}
  });
}

late int iduser;
bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 6, 22, 72),

        title: Text(
          'Login',style: TextStyle(fontWeight:FontWeight.w500),
        ),
      
        //centerTitle: true,
        elevation: 30,
      ),

drawer: Drawerfunc(),

      /////////////////////////////////////
      
      body:
      
   
           Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (emailController) {
                        if (emailController == null || emailController == '' || emailController.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if(emailController.length < 8){
                          return 'too short';
                        }
                        if(emailController.contains('@') == false || emailController.contains('.') == false){
                          return 'Invalid email format';
                        }
                        return null;
                      },
                     
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                  
                      decoration: InputDecoration(
                         hintText: 'emal@gmail.com',
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
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (passwordController) {
                        if (passwordController == null || passwordController == '' || passwordController.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if(passwordController.length<8){
                          return 'Invalid';
                        }

                        return null;
                      },    
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                       
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


                    SizedBox(
                      height: 65.0,
                    ),

                    Center( 
                    child:
                     Material(
                         color: Color.fromARGB(255, 6, 22, 72),
                        elevation :10,
                        borderRadius:BorderRadius.circular(30),
                        //width: 150,
                     
                        child: MaterialButton(

                           onPressed: (){
                          //  logIn();
                          _onPrassed();
                          },
                           height: 60,
                   minWidth: double.infinity,
                          child: Text(
                            'Login',
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
                            'Don\'t have an account ?'
                        ),
                        TextButton(
                          onPressed: (){Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:(BuildContext context)=> RegisterScreen(),
                       ),
   );
   },
                          child: Text(
                            'Register Now',
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
        ],
      ),//    ;

    
 
    );

  }

}
