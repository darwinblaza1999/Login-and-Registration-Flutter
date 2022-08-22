import 'package:flutter/material.dart';
import 'package:app/UI/login/components/text_decorator.dart';

class PasswordTextField extends StatelessWidget {
   const PasswordTextField({
    Key? key,
    required this.ErrorText,
    required this.uHintText, 
    required this.userpassController, 
    required this.passHintTextColor, 
    required this.passTextFieldPrefixIcon, 
    required this.onUserPassChange, 
    required this.passColor, 
    required this.suffixIcon, 
    required this.suffixIconColor,
  }) : super(key: key);

  final TextEditingController userpassController;
  final String ErrorText;
  final String uHintText;
  final Color passHintTextColor;
  final IconData passTextFieldPrefixIcon;
  final Color passColor;
  final Function onUserPassChange;
  final IconData suffixIcon;
  final Color suffixIconColor;
  
  //bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //child: TextFormField(
      controller: userpassController,
      validator: (value){
        if(value!.isEmpty){
          return ErrorText;
        }
        else{
          return null;
        }
      },
      onChanged: (value){
        onUserPassChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      style:  const TextStyle(color: Colors.black,
      ),
      obscureText: true,
      decoration: InputDecoration(
        hintText: uHintText,
        hintStyle: TextStyle(
          color: passHintTextColor
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            passTextFieldPrefixIcon,
            color: Colors.black,
          )
      ),
    );
    //);
  }
}

