class User {
  String? id;
  String? fullName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;
  String? userRole;
  String? refreshToken;
  String? createdTime;
  String? updatedTime;
  String? userId;
  bool? verifyUser;
  String? verifyOtp;
  bool? active;
  String? bio;
  String? profilePhoto;

  User(
      {required this.id,
      required this.fullName,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.token,
      required this.userRole,
      required this.refreshToken,
      required this.createdTime,
      required this.updatedTime,
      required this.userId,
      required this.verifyUser,
      required this.verifyOtp,
      required this.active,
      required this.bio,
      required this.profilePhoto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fullName = json['fullName'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    userRole = json['userRole'];
    refreshToken = json['refreshToken'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    userId = json['userId'];
    verifyUser = json['verifyUser'];
    verifyOtp = json['verifyOtp'];
    active = json['active'];
    bio = json['bio'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['fullName'] = fullName;
    data['password'] = password;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['token'] = token;
    data['userRole'] = userRole;
    data['refreshToken'] = refreshToken;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['userId'] = userId;
    data['verifyUser'] = verifyUser;
    data['verifyOtp'] = verifyOtp;
    data['active'] = active;
    data['bio'] = bio;
    data['profilePhoto'] = profilePhoto;
    return data;
  }
}
