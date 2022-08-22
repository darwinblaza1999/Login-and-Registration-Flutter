import 'package:app/Controllers/dropdown_controller.dart';
import 'package:app/Controllers/signup_controller.dart';
import 'package:app/UI/SignUp/components/signup_background.dart';
import 'package:app/UI/SignUp/components/textfield_decorator.dart';
import 'package:app/UI/components/button.dart';
import 'package:app/UI/custom_widget.dart';
import 'package:app/UI/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/signup_profile.dart';
import 'components/signup_textfield.dart';

class SignUp extends StatelessWidget{
    SignUp ({Key?key}) : super(key: key);

  TextEditingController nameController = TextEditingController ();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  String ? value;
  List<String>? test1;
  var selectedType;


  SignupController signupController = Get.put(SignupController());
  DropdownController dropdownlist = Get.put(DropdownController());

  final _globalKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SignUpBackground(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const Text("Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                ),
                 SignupProfile(),
                const SizedBox(
                  height: 20,
                ),
                Obx(()=> 
                  SignUpTextFieldDecorator(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconSize: 36,
                        alignment:  Alignment.center,
                        isExpanded: true,
                        hint: Text(
                          dropdownlist.selected.value,
                        ),
                      //   onTap: () async {
                      //   await dropdownlist.getbranches();
                      //  },
                        // onChanged: (newValue){
                        //   dropdownlist.setSelected(newValue.toString());
                        // },
                        // value: value,
                        // items: dropdownlist.testbranch.map((selectedType){
                        //   return DropdownMenuItem(
                        //     child : Text(
                        //       selectedType,
                        //     ),
                        //     value : selectedType
                        //   );
                        // }).toList(),

                         // dropdownlist.getbranches(), //dropdownlist.selected.value,
                        //onTap: (){dropdownlist.getbranches();},
                        items: dropdownlist.selectedBranch.map(buildmenuItem).toList(),
                        value: selectedType,
                       onChanged: (value) async{
                        print(value);
                        //await dropdownlist.getbranches();
                          
                        //dropdownlist.getbranches();
                          dropdownlist.setSelected(value.toString());
                          selectedType = value.toString();
                       },
                       
                       ),
                    ),
                  )
                ),
                 SignUpTextFieldDecorator(
                  child: SignUpTextField(
                    useridController: nameController,
                    ErrorText: "Name cannot be empty", 
                    uHintText: 'Enter name', 
                    uHintTextColor: Colors.white,
                    uTextFieldPrefixIcon: Icons.person,
                    onUserChange: (value){
                    }, 

                    ),
                  ),

                  SignUpTextFieldDecorator(
                  child: SignUpTextField(
                    useridController: emailController,
                    ErrorText: "Email cannot be empty", 
                    uHintText: 'Enter email', 
                    uHintTextColor: Colors.white,
                    uTextFieldPrefixIcon: Icons.email,
                    onUserChange: (value){
                    }, 

                    ),
                  ),

                  SignUpTextFieldDecorator(
                  child: SignUpTextField(
                    useridController: passwordController,
                    ErrorText: "Password cannot be empty", 
                    uHintText: 'Enter password', 
                    uHintTextColor: Colors.white,
                    uTextFieldPrefixIcon: Icons.lock,
                    onUserChange: (value){
                    }, 

                    ),
                  ),

                  SignUpTextFieldDecorator(
                  child: SignUpTextField(
                    useridController: confirmPassController,
                    ErrorText: "Confirm Password cannot be empty", 
                    uHintText: 'Enter Password', 
                    uHintTextColor: Colors.white,
                    uTextFieldPrefixIcon: Icons.lock,
                    onUserChange: (value){
                    }, 

                    ),
                  ),
                  CustomButton(
                    textcolor: Colors.grey,
                    buttonColor: Mytheme.loginButtonColor, 
                    buttontext: "Sign Up",
                    handleButtonClick: (){
                      signUp();
                      //dropdownlist.getbranches();
                      //print(dropdownlist.test);
                    }
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  const Text(
                        //   "Already have account ?",
                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        InkWell(
                          child: const Text(
                            "Already have account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 15,
                              color: Colors.grey,
                              ),
                          ),
                          onTap: ()
                          {                                 
                            Get.to(
                              Builder(builder: 
                              (context) => LoginPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    )
              ],
            ),
          ),
        ),
        )
        );
    //);
  }

  DropdownMenuItem<String> buildmenuItem(String item) => DropdownMenuItem(
    value: item, 
    child: Text(
      item,
      style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20,
      ),
    ),
  );
  
  void signUp() {
    final _isvalid = _globalKey.currentState!.validate();
    if(_isvalid){
      signupController.signupUser(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPassController.text
        );
    }
    else
    {
      return null;
    }

  }
}

