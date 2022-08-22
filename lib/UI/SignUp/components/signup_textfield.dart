import 'package:flutter/material.dart';

import '../../login/components/text_decorator.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    Key? key,
    required this.useridController,
    required this.ErrorText,
    required this.uHintText,
    required this.uHintTextColor,
    required this.uTextFieldPrefixIcon, 
    required this.onUserChange,
  }) : super(key: key);

  final TextEditingController useridController;
  final String ErrorText;
  final String uHintText;
  final Color uHintTextColor;
  final IconData uTextFieldPrefixIcon;
  final Function onUserChange;

    @override
  Widget build(BuildContext context) {
    return TextFormField(
      //child: TextFormField(
      controller: useridController,
      validator: (value){
        if(value!.isEmpty){
          return ErrorText;
        }
        else{
          return null;
        }
      },
      onChanged: (value){
        onUserChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.primary,
      style:  const TextStyle(color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: uHintText,
        hintStyle: TextStyle(
          color: uHintTextColor
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            uTextFieldPrefixIcon,
            color: Colors.black,
          )
      ),
    );
    //);
  }
}