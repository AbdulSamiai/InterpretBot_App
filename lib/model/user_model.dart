class UserModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? userEmail;
  String? phoneNo;
  int? language;
  String? purpose;
  String? discovered;
  String? userType;
  String? status;

  UserModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.userEmail,
      this.phoneNo,
      this.language,
      this.purpose,
      this.discovered,
      this.userType,
      this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userEmail = json['UserEmail'];
    phoneNo = json['PhoneNo'];
    language = json['Language'];
    purpose = json['Purpose'];
    discovered = json['Discovered'];
    userType = json['UserType'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['UserEmail'] = userEmail;
    data['PhoneNo'] = phoneNo;
    data['Language'] = language;
    data['Purpose'] = purpose;
    data['Discovered'] = discovered;
    data['UserType'] = userType;
    data['Status'] = status;
    return data;
  }
}
