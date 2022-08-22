

import 'dart:convert';

import 'package:app/Model/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DropdownController extends GetxController{
  String branch = "";
  List<String> testbranch  = ["Head office","Trial Branch","Jewelry Branch"].obs;
  //List<Map<String, Object>> brid = {}.obs;
  
   List<Map<String, dynamic>> json = [{
  "id": 000,
  "Title": "Head office"
}, {
  "id": 1234,
  "Title": "Trial Branch"
}, {
  "id": 9999,
  "Title": "Jewelry Branch"
}].obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getbranches();
  }

//RxList<test4> Product = (List<test4>.of([])).obs;


  ///RxList<ServiceResponse> item = l
  var response = ServiceResponse();
  var item = [].obs;

  var selected = 'Select Branches'.obs;

  String test = "";

  // var selectedBranch = <String>[].obs;
  List<String> selectedBranch = [''].obs;
  var selectValue = ''.obs;

  void setSelected(String value){
    selected.value = value;
  }

  getbranches() async
  {
    var url = await http.get(Uri.parse("https://uat.rdpawnshop.com/RDCashAPI/api/SMSMG/GetBranchSpecific/000"),
    //http://localhost:3647/api/SMSMG/GetBranchSpecific/000
    headers: {
            'Content-Type':'application/json'
        },
      );

      if(url.body != "" && url.body != "[]")
      {
         var data = jsonDecode(url.body);
        response = ServiceResponse.fromJson(data);
        if(response.responseCode == 100)
        {
          var list = response.data;
            selectedBranch = list!.map((e) => e['AreaID'].toString()).toList();
            print(selectedBranch);
        }
      }


      //selectedBranch = json.map((e) => e['Title'].toString()).toList();
      
   // test4 = (json.map((e) => e['Title'] as String)).toList();
    // Future<void> getBranch() async {

    //      //test4 = (json.map((e) => e['Title'] as String)).toList();
  
    //     // var url = await http.get(Uri.parse("https://uat.rdpawnshop.com/RDCashAPI/api/Maintenance/GetdsBranches"),
    //     // headers: {
    //     //   'Content-Type':'application/json'
    //     // },
    //     // );

    //     // if(url.body != "" && url.body != "[]")
    //     // {
    //     //   var data = jsonDecode(url.body);
    //     //   response = ServiceResponse.fromJson(data);
    //     //   if(response.responseCode == 100)
    //     //   {
            
    //     //     var list = response.data;
    //     //     for(var sample in data) {
    //     //       test =   sample['data']['Code'];

    //     //     }

         

    //     //     print(test);

    //     //      ///List<String>? test1 = (response.data?.map((e) => e['Name'] as String)).toList();
    //     //     //var listdata = List<String>.from(response.data);
    //     //     //item = branches.map((list) => list.Name).toList();
            
    //     //   }
    //     // }
    //   }
  }
}
