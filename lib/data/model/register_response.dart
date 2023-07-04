import 'login_response.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed.nabil@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTMwMWZmMmY4ZmMyMzg4ODU1MzUxYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4NDA0NjMwLCJleHAiOjE2OTYxODA2MzB9.wM2QGSdle8LCNBcUDpxUEQIIQHCUXNetBshEg197VnI"

class RegisterResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  FormError? errors;


  RegisterResponse({
      this.message, 
      this.user, 
      this.token,
      this.statusMsg});

  RegisterResponse.fromJson(dynamic json) {
    message = json["message"];
    errors = json["errors"] != null ? FormError.fromJson(json["errors"]): null;
    statusMsg = json["statusMsg"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"];
  }
}
class FormError{
  String? value;
  String? msg;
  String? param;

  FormError({
    this.value,
    this.msg,
    this.param});

  FormError.fromJson(dynamic json) {
    if(json != null){
      value = json["value"];
      msg = json["msg"];
      param = json["param"];
    }
  }
}