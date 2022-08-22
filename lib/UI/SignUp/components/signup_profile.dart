import 'dart:io';
import 'package:app/Controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupProfile extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

   SignupProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupController = Get.put(SignupController());
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(()=>
        CircleAvatar(
          backgroundImage: signupController.isProfilePathSet.value == true
          ? FileImage(File(signupController.ProfilePath.value))
          as ImageProvider
          : const AssetImage("assets/images/camera.png"),
          radius: 60,
        ),
        ), 
        Positioned(
          bottom: 0,
          child: InkWell(
            child: const Icon(Icons.camera),
            onTap: (){
              //print("cam");
              showModalBottomSheet(context: context, builder: (context)=> bottomSheet(context));
            },
            ),
          )
      ],
    );
  }
  
  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
          ),
          const SizedBox(
            height: 50 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image,
                    color: Colors.blueGrey,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                onTap: (){
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.camera),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
                onTap: (){
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  

  Future<void> takePhoto(ImageSource source) async {
    final pickeImage = 
    await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickeImage!.path);

    Get.back();

  //   takePhoto(ImageSource source, BuildContext context) async {
  //   final pickeImage = 
  //   await imagePicker.pickImage(source: source, imageQuality: 100);
  //   pickedFile = File(pickeImage!.path);

  //   Navigator.pop(context);
  // }
  }
}
