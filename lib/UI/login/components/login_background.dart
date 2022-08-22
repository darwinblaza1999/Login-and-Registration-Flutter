import 'package:flutter/material.dart';



class LoginBackground extends StatelessWidget {
  final Widget child;
   const LoginBackground({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   child: Image.asset('' ,
          //   width: size.width * 0.4, ),
          //   top: 0,
          //   left: 0,
          //  ),
           child,
        ],
      ),
    );
  }
}