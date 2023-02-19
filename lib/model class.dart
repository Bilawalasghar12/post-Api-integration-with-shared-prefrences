import 'dart:convert';


Login? photosFromMap(String str) => Login.fromMap(json.decode(str));

String photosToMap(Login? data) => json.encode(data!.toMap());

class Login {
  Login({
    this.emailAddress,
    this.message,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? emailAddress;
  String? message;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    emailAddress: json["email_address"],
    message: json["message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toMap() => {
    "email_address": emailAddress,
    "message": message,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}








class SkillDetail {
  SkillDetail({
    required this.message,
    required this.data,
  });

  String message;
  Bbb data;

  factory SkillDetail.fromJson(Map<String, dynamic> json) => SkillDetail(
    message: json["message"],
    data: Bbb.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Bbb {
  Bbb({
    required this.earned,
    required this.all,
  });

  List<dynamic> earned;
  List<All> all;

  factory Bbb.fromJson(Map<String, dynamic> json) => Bbb(
    earned: List<dynamic>.from(json["earned"].map((x) => x)),
    all: List<All>.from(json["all"].map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "earned": List<dynamic>.from(earned.map((x) => x)),
    "all": List<dynamic>.from(all.map((x) => x.toJson())),
  };
}

class All {
  All({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.pngImage,
  });

  int id;
  String name;
  String description;
  String image;
  int status;
  String pngImage;

  factory All.fromJson(Map<String, dynamic> json) => All(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    status: json["status"],
    pngImage: json["png_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "status": status,
    "png_image": pngImage,
  };
}
