class UserCookie {
  int? userID;
  String? token;

  UserCookie({this.userID, this.token});

  UserCookie.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['Token'] = token;
    return data;
  }
}
