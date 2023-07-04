/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed.nabil@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTMwMWZmMmY4ZmMyMzg4ODU1MzUxYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4NDA0NjMwLCJleHAiOjE2OTYxODA2MzB9.wM2QGSdle8LCNBcUDpxUEQIIQHCUXNetBshEg197VnI"

class LoginResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  LoginResponse({
      this.message, 
      this.user, 
      this.token,
      this.statusMsg});

  LoginResponse.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"];
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