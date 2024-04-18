class RoomMember {
  int? userId;
  String? userName;
  bool? isCreator;

  RoomMember({this.userId, this.userName, this.isCreator});

  RoomMember.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    userName = json['UserName'];
    isCreator = json['IsCreator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['IsCreator'] = isCreator;
    return data;
  }
}
