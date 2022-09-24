class UserModel {
  //khai bao late truoc bien de no chap nhat khai bao bien muon
  late String userName;
  int? userAge;
  List<String>? emails;

  UserModel({required this.userName, this.userAge, this.emails});

  UserModel.empty() {
    userName = "";
    userAge = 0;
    emails = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['UserName'] = userName;
    data['UserAge'] = userAge;
    data['Emails'] = emails;

    return data;
  }
}
