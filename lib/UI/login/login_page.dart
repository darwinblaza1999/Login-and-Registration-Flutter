import 'package:app/UI/custom_widget.dart';
import 'package:app/UI/login/components/login_background.dart';
import 'package:app/UI/SignUp/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/button.dart';
import 'components/password_textfield.dart';
import 'components/text_decorator.dart';
import 'components/username_textfield.dart';

class  LoginPage extends StatelessWidget{
   final _formKey = GlobalKey<FormState>();

  TextEditingController useridController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String ErrorText = "Field cannot be empty.";
  String uHintText = "Enter username";
  Color uHintTextColor = Colors.grey.shade400;
  IconData uTextFieldPrefixIcon = Icons.person;
  Color uTextFieldPrefixColor = Colors.black;

  LoginPage ({Key?key}):super(key: key);

  @override
  Widget build (BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/images/code.png"),
            const Text("LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold,
             fontSize: 20,),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextFieldDecorator(
                     child: UserNameTextField(
                        useridController: useridController,
                        ErrorText: ErrorText,
                        uHintText: uHintText,
                        uHintTextColor: uHintTextColor,
                        uTextFieldPrefixIcon: uTextFieldPrefixIcon,
                        onUserChange: (value){
                          //print(value);
                        },
                      ),
                   ),
                 
                    TextFieldDecorator(
                      child: PasswordTextField(
                      userpassController: passwordController,
                      ErrorText: "Password cannot be empty!",
                      uHintText: "Enter Password",
                      passHintTextColor: uHintTextColor,
                      passTextFieldPrefixIcon: uTextFieldPrefixIcon,
                      passColor: uTextFieldPrefixColor,
                      suffixIcon: Icons.visibility_off,
                      suffixIconColor: Colors.blueGrey,

                      onUserPassChange: (value){
                        //print("pass value $value");
                      },   
                  ),
                    ),
                  CustomButton(
                    buttonColor: Mytheme.loginButtonColor,
                    buttontext: "LOGIN",
                    textcolor: Colors.white,
                    handleButtonClick: (){
                      //print("LOGIN");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(fontWeight: FontWeight.bold
                        ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: const Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        ),
                        onTap: (){
                          Get.to(
                            () => SignUp(),
                            // Builder(
                            //     builder: (context)=> SignUp(),
                            //         )
                            );
                          
                        },
                      ),
                    ],
                  )
              ],
              ),
            )
          ],
          ),
        ),
        ),
    );
  }
}



