/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed.nabil@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTMwMWZmMmY4ZmMyMzg4ODU1MzUxYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4NDkwODIwLCJleHAiOjE2OTYyNjY4MjB9.DlEsC9cPbnwDIHp0dbhq4Kmn22sCHuSOadW1A21I9wI"

class AuthResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  FormError? error;

  AuthResponse({
      this.message, 
      this.user, 
      this.token,
      this.statusMsg,
      this.error});

  AuthResponse.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"];
    error = json["errors"] != null ? FormError.fromJson(json["errors"]) : null;
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmed.nabil@gmail.com"
/// role : "user"

class User {
  String? name;
  String? email;
  String? role;

  User({
      this.name, 
      this.email, 
      this.role});

  User.fromJson(dynamic json) {
    name = json["name"];
    email = json["email"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["email"] = email;
    map["role"] = role;
    return map;
  }

}

class FormError {
  String? value;
  String? msg;
  String? param;

  FormError({
    this.value,
    this.msg,
    this.param});

  FormError.fromJson(dynamic json) {
    value = json["value"];
    msg = json["msg"];
    param = json["role"];
  }

}