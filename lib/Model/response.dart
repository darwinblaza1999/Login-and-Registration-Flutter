class ServiceResponse {
  List? data;
  int? responseCode;
  String? responseMessage;

  ServiceResponse({
      this.data, 
      this.responseCode,
      this.responseMessage
     });

  ServiceResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}