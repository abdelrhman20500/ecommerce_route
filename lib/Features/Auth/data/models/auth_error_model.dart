
class AuthErrorModel {
  String? statusMsg;
  String? message;

  AuthErrorModel({this.statusMsg, this.message});

  AuthErrorModel.fromJson(Map<String, dynamic> json) {
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