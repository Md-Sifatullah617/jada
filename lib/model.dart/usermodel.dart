class UserModel {
  final int id;
  final String email;
  final String fName;
  final String lName;
  final String avatar;
  UserModel(
      {required this.id,
      required this.email,
      required this.fName,
      required this.lName,
      required this.avatar});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        fName: json['fName'],
        lName: json['lName'],
        avatar: json['avatar']);
  }
}
