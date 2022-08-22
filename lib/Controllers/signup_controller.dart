import 'dart:convert';
import 'dart:io';
import 'package:app/Helper/dialog_helper.dart';
import 'package:app/Model/response.dart';
import 'package:app/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SignupController extends GetxController{
  var isProfilePathSet = false.obs;
  var ProfilePath = "".obs;

  var profileImageBase64;
  final selected = "Select Branch" .obs;

  String Uname = "";
  String Uemail = "";
  String Upassword = "";

  void setProfileImagePath(String path){
    ProfilePath.value = path;
    isProfilePathSet.value = true;

    //final bytes = File(ProfilePath.value).readAsBytesSync();
    //profileImageBase64 = base64.encode(bytes);
  }

  void signupUser(String name, String email, String password, String repassword){
    isProfilePathSet.value = true;
    if(isProfilePathSet.value == false)
    {
      Get.snackbar("Sign Up Failed", "Please select profile picture",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      borderWidth: 2,
      );
    }
    else if(password != repassword)
    {
      Get.snackbar("Sign Up Failed", "Passwordclea doesn't match!",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      borderWidth: 2,
      );
    }
    // else if(isEmailValid(email))
    // {
    //   Get.snackbar("Sign Up Failed", "Invalid email!",
    //   backgroundColor: Colors.red,
    //   snackPosition: SnackPosition.BOTTOM,
    //   borderRadius: 10,
    //   borderWidth: 2,
    //   );
    // }
    else{
      Uname = name;
      Uemail = email;
      Upassword = password;

      sendDataToServer();
    }
  }

  void setSelected(String value){
    selected.value = value;
  }

  bool isEmailValid(String email){
    bool emailValid = RegExp(
      r"^[a-zA-z0-9.a-zA-Z0-9.!#$%'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(email);
    return emailValid;
  }
  
  Future<void> sendDataToServer() async {
    try{
         Map<String, dynamic> dataBody = {
      //images
      CustomWebServices.name : Uname,
      CustomWebServices.email : Uemail,
      CustomWebServices.password : Upassword,
    };

    var dataToSend = json.encode(dataBody);
    //var response = await http.get(Uri.parse("https://uat.rdpawnshop.com/RDCashAPI/api/Access/GetEmpId/y-088"),
    var response = await http.get(Uri.parse("https://uat.rdpawnshop.com/RDCashAPI/api/Maintenance/GetdsBranches"),
    headers: {
        'Content-Type':'application/json'
    },
    );

    if(response.body != "" && response.body != "[]")
    {
      var test1 = jsonDecode(response.body);
      var res =  ServiceResponse.fromJson(test1);
      if(res.responseCode == 100)
      {
        var re1 = res.data.toString();
        Get.snackbar("Sign Up Success", "success test: $re1",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
      else
      {
        var re1 = res.responseMessage.toString();
        Get.snackbar("Sign Up Failed", "Failed test: $re1",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    }

    // var response = await http.post(Uri.parse("http://192.168.210.171/api/Test/InsertData"),
    // headers: {
    //   'Content-Type':'application/json'
    // },
    // body:dataToSend
    // );

    //print(response);
    //return service;
    }
    catch (ex){
      var msg = 'Error $ex';
      DialogMessage.showErrorMessage(description: msg);
      // Get.snackbar("Exception","message $ex",
      // backgroundColor: Colors.red,
      // snackPosition: SnackPosition.BOTTOM,
      // borderRadius: 10,
      // borderWidth: 2,
      // );
    }
   
  }
}