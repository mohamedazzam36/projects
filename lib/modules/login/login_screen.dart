import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  bool iconPressed = true ;

  var formkey = GlobalKey<FormState>();

  var emailcontroler = TextEditingController();

  var Passwordcontroler = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(240, 6, 196, 243),
        title: Text(
          'messenger',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailcontroler,
                    onChanged: (value) 
                    {
                      print(value);
                    },
                    validator: ( value) {
                      if(value == null || value.isEmpty ){
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value)
                    {
                      print(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),        
                  SizedBox(
                    height: 15,
                  ),
                   defaultFormField(
                    validator: (value) {
                        if(value == null || value.isEmpty){
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    suffixPressed: () {
                      
                      setState(() {
                        iconPressed = !iconPressed;

                      });
                      
                    },
                    suffixIcon: iconPressed ? Icons.visibility_off : Icons.visibility,
                    isPassword: iconPressed ,
                    controller: Passwordcontroler, 
                    keyboard: TextInputType.visiblePassword, 
                    labelText: 'Password', 
                    prefixIcon: Icons.lock,
                    onPressed: (value) {
                      print(value);
                    },
                    onChanged: (value){
                      print(value);
                    },
                    ),
                   SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: (){
                      if(formkey.currentState?.validate() ?? false){
                         print(emailcontroler.text);
                      print(Passwordcontroler.text);
                      }
                    }, 
                    text: 'login',
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}