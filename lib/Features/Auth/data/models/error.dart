
class Erorr {
  String? message;
  Errors? errors;

  Erorr({this.message, this.errors});

  Erorr.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["errors"] is Map) {
      errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    if(errors != null) {
      data["errors"] = errors?.toJson();
    }
    return data;
  }
}

class Errors {
  String? value;
  String? msg;
  String? param;
  String? location;

  Errors({this.value, this.msg, this.param, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    if(json["value"] is String) {
      value = json["value"];
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
    if(json["param"] is String) {
      param = json["param"];
    }
    if(json["location"] is String) {
      location = json["location"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["msg"] = msg;
    data["param"] = param;
    data["location"] = location;
    return data;
  }
}