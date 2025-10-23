
class VerifyResetCodeModel {
  String? status;

  VerifyResetCodeModel({this.status});

  VerifyResetCodeModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    return data;
  }
}