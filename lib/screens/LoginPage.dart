import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/components/BlueButton.dart';
import 'package:khaliq_bus/components/BlueTextField.dart';
import 'package:khaliq_bus/screens/HomePage.dart';
import 'package:khaliq_bus/services/firebaseauth_service.dart';
import 'package:khaliq_bus/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Center(
            child: signUp ? const Text('Sign Up', style: AppBarTextStyle,) : const Text('Login', style: AppBarTextStyle,)
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            //Textfields
            BlueTextField(controller: emailController, name: 'Email', obscuretext: false,),
            const SizedBox(height: 30,),
            BlueTextField(controller: passwordController, name: 'Password', obscuretext: true,),
            const SizedBox(height: 30,),

            //Continue button
             Column(
               children: [
                 InkResponse(
                  child: const BlueButton(text: 'CONTINUE'),
                  onTap: () async {
                    if(signUp){
                      var newuser = await FirebaseAuthService().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()
                      );

                      debugPrint('Your newuser is null');

                    if(newuser !=null){
                      // debugPrint('$newuser');
                      debugPrint('SignUp successfull');
                      Get.offAll(() => const HomePage());
                    }
                  }else{
                      var reguser = await FirebaseAuthService().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()
                      );

                      debugPrint('Your reguser is null');
                      if(reguser !=null){
                        debugPrint('Sign In successfull');
                        Get.offAll(() => const HomePage());
                      }
                    }
                  },
                ),
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
        )
      ),
    );
  }
}

