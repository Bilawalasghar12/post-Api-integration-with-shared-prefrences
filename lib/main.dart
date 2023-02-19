import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2_api_integration/Screen.dart';
import 'model class.dart';
import 'Screen.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: App(),
      ),
    ),
  );

}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();



}

class _AppState extends State<App> {
  TextEditingController emailcontroller = TextEditingController       (text:"mm@mm.com");
  TextEditingController passwordcontroller = TextEditingController    (text:"12345678");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Login page'),
      ),
      body: SingleChildScrollView(   child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              child: Image.asset('assets/assets.png',),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField( controller: emailcontroller,
                decoration: InputDecoration(
                hintText: 'Email'
              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField( controller: passwordcontroller,
                decoration: InputDecoration( hintText: 'Password'),),
            ),
            SizedBox(height: 10,),
            Text('Forgot password', style: TextStyle(color: Colors.blue,),),
            SizedBox(height: 10,),
            ElevatedButton( onPressed: () {
              print(emailcontroller.text);
              post(emailcontroller.text, passwordcontroller.text);
            }, child: Text('Login', style: TextStyle(fontSize: 15, ),),),
            SizedBox(height: 170,),
            Text('New User? Create Account', style: TextStyle(decoration: TextDecoration.underline),)

          ],
        ),
      ),

    );
  }

  post(
      String email, String password)async{
    print(email);
    print(password);
    var header = {'Content-Type': 'application/json', 'Accept':'application/json' };
    final response = await http.post(
        Uri.parse("https://staging.get-licensed.co.uk/guardpass/api/auth/login"),

        body: json.encode({'email_address': email, 'password': password}),  headers: header,);


    
     if(response.statusCode==200){

       var data = jsonDecode(response.body);

       Login l = Login.fromMap(data);
       addStringToSF(l.accessToken.toString());

       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => const SecondScreen()),
       );}
    print(response.statusCode);


  }

  addStringToSF( String value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', "$value");
  }




}













