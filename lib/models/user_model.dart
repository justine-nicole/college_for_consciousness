class UserModel {
  UserModel({
    this.userId = -1,
    this.firstName,
    this.lastName,
    this.email,
  });
  int? userId;
  String? firstName;
  String? lastName;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };
}