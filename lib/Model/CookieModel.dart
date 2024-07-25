class UserCookie {
  int? userID;
  String? token;

  UserCookie({this.userID, this.token});

  UserCookie.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['token'] = this.token;
    return data;
  }
}
