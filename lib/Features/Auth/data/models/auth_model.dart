
class AuthModel {
  String? message;
  User? user;
  String? token;

  AuthModel({this.message, this.user, this.token});

  AuthModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    if(user != null) {
      data["user"] = user?.toJson();
    }
    data["token"] = token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? role;

  User({this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["role"] = role;
    return data;
  }
}