import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,

    required this.textcolor,
    required this.buttonColor,
    required this.buttontext, 
    required this.handleButtonClick
  }) : super(key: key);

  final Color buttonColor;
  final String buttontext;
  final Color textcolor;
  final Function handleButtonClick;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width:  size.width * 0.8,
      child: ClipRect(
        child: ElevatedButton(
          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15
            ),
            ),
          backgroundColor: 
          MaterialStateProperty.all(buttonColor)
          ),
          onPressed: () {
            handleButtonClick();
          }, 
          child: Text(
            buttontext,
            style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15 ,
            color: textcolor
          ),
          )
          ),
      ),
    );
  }
}