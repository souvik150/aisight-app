class User {
  String? name;
  String? email;
  String? password;
  String? phoneNum;
  String? height;
  String? weight;
  List<UserPictures>? userPictures;

  User(
      {this.name,
        this.email,
        this.password,
        this.phoneNum,
        this.height,
        this.weight,
        this.userPictures});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNum = json['phone_num'];
    height = json['height'];
    weight = json['weight'];
    if (json['user-pictures'] != null) {
      userPictures = <UserPictures>[];
      json['user-pictures'].forEach((v) {
        userPictures!.add(new UserPictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_num'] = this.phoneNum;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.userPictures != null) {
      data['user-pictures'] =
          this.userPictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserPictures {
  String? pictureLink;
  String? dateAndTime;

  UserPictures({this.pictureLink, this.dateAndTime});

  UserPictures.fromJson(Map<String, dynamic> json) {
    pictureLink = json['picture link'];
    dateAndTime = json['date and time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picture link'] = this.pictureLink;
    data['date and time'] = this.dateAndTime;
    return data;
  }
}