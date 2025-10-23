
class ForgetPasswordModel {
  String? statusMsg;
  String? message;

  ForgetPasswordModel({this.statusMsg, this.message});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    if(json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["statusMsg"] = statusMsg;
    data["message"] = message;
    return data;
  }
}