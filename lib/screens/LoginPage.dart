// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/BlueButton.dart';
import 'package:khaliq_bus/components/BlueTextField.dart';
import 'package:khaliq_bus/services/firebaseauth_service.dart';
import 'package:khaliq_bus/style.dart';
import 'package:khaliq_bus/utils/dialogutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displaynameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 

  bool signUp = true;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    displaynameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Center(
            child: signUp ?  Text('Sign Up', style: AppBarTextStyle,) :  Text('Login', style: AppBarTextStyle,)
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Textfields
                BlueTextField(controller: emailController, name: 'Email', obscuretext: false,),
                const SizedBox(height: 30,),
                BlueTextField(controller: passwordController, name: 'Password', obscuretext: true,),
                const SizedBox(height: 30,),
                  
                signUp ? BlueTextField(controller: displaynameController, name: 'Display Name', obscuretext: false,) : const SizedBox(),
                const SizedBox(height: 30,),
                
                 Column(
                   children: [

                    //Continue button
                     InkResponse(
                      child: const BlueButton(text: 'CONTINUE'),
                      onTap: () async {
                        if(signUp){
                          var newuser = await FirebaseAuthService().signUp(
                            displayname: displaynameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                          );
                       
                          if(newuser !=null){
                            showDialogOK(context: context, title:  'Sign Up',  content: 'Sign Up successful!', home: true);
                          }

                        }else{
                          var reguser = await FirebaseAuthService().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                          );
                       
                          if(reguser !=null){
                            showDialogOK(context: context, title:  'Sign In',  content: 'Sign In successful!', home: true);
                          }
                        }
                 
                        if(!_formKey.currentState!.validate()){
                          showDialogOK(context: context, title:  'Error',  content: 'Form entry has errors!', home: false);
                        }
                      },
                    ),

                    //Have an account?
                     const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        signUp 
                        ? const Text('Already have an account?', style: BodyTextStyle,) 
                        : const Text('Don\'t have an account?', style: BodyTextStyle,),
                       
                        const SizedBox(width: 5,),
                       
                        InkResponse(
                          child: signUp 
                          ? const Text('Login', style: LinkTextStyle,) 
                          : const Text('Sign Up', style: LinkTextStyle,),
                          onTap: (){
                            setState(() {
                              signUp = !signUp;
                            });
                          },
                        ),
                      ],
                     )
                   ],
                 ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

