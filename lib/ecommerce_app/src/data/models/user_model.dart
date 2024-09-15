import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson);

class UserModel {
  String? userName;
  String? email;

  UserModel({
    this.userName,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic>json)=>UserModel(
   userName: json["user_name"],
    email: json["email"],
  );

  Map<String,dynamic> toJson()=>{
    "user_name":userName,
    "email":email,
  };

}
