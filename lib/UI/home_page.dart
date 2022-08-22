import 'package:app/UI/SignUp/signup.dart';
import 'package:app/UI/custom_widget.dart';
import 'package:app/UI/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/background.dart';
import 'components/button.dart';

class HomePage extends StatelessWidget{

  const HomePage({Key? key}): super(key: key);

   @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Background(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("Welcome to My Team",
          style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold,
          ),
          ),
          Image.asset(
            "assets/images/code1.png",
            width: size.width * 0.7,
          ),
          CustomButton(
            textcolor: Theme.of(context).colorScheme.primary, 
            buttonColor: Mytheme.loginButtonColor, 
            buttontext: "LOGIN", 
            handleButtonClick: () {loginButtonClickHandler(context);
            },
            ),
            const SizedBox(height: 20,
            ), 
          CustomButton(
            textcolor: Theme.of(context).colorScheme.primary, 
            buttonColor: Mytheme.registerButtonColor, 
            buttontext: "REGISTER", 
            handleButtonClick: (){
              signupButtonClickHandler();
            } 
            )
        ],
        ),
        )
        
        ),
        );
  }
 loginButtonClickHandler(BuildContext context){
   Get.to(
      Builder(
        builder: (context)=> LoginPage(),
        )
      );
 }

  signupButtonClickHandler(){
    Get.to(()=> SignUp()
      // Builder(
      //   builder: (context)=> SignUp(),
      //   )
      );
 }

}



