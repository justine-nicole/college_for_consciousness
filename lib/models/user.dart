import 'package:college_for_consciousness/models/article.dart';
import 'package:college_for_consciousness/models/author.dart';
import 'package:college_for_consciousness/models/avatar.dart';
import 'package:college_for_consciousness/models/campus.dart';
import 'package:college_for_consciousness/models/course.dart';
import 'package:college_for_consciousness/models/transaction.dart';

class User {
  User({
    this.userId = -1,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.city,
    required this.email,
    this.avatar,
    this.creditBalance = 0,
    this.articlesRead = const <Article>[],
    this.favoriteArticles  = const <Article>[],
    this.followedAuthors  = const <Author>[],
    this.campusesMemberOf  = const <Campus>[],
    this.coursesEnrolledIn  = const <Course>[],
    this.coursesGraduated  = const <Course>[],
    this.transactions  = const <Transaction>[],
  });

  int userId;
  String firstName;
  String lastName;
  String countryCode;
  String city;
  String email;
  Avatar? avatar;
  double creditBalance;
  List<Article> articlesRead;
  List<Article> favoriteArticles;
  List<Author> followedAuthors;
  List<Campus> campusesMemberOf;
  List<Course> coursesEnrolledIn;
  List<Course> coursesGraduated;
  List<Transaction> transactions;

  factory User.fromJson(Map<String, dynamic> json) => User(
      userId: json["userId"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      countryCode: json["countryCode"],
      city: json["city"],
      email: json["email"],
      avatar: json["avatar"],
      creditBalance: json["creditBalance"],
      articlesRead: json["articlesRead"],
      favoriteArticles: json["favoriteArticles"],
      followedAuthors: json["followedAuthors"],
      campusesMemberOf: json["campusesMemberOf"],
      coursesEnrolledIn: json["coursesEnrolledIn"],
      coursesGraduated: json["coursesGraduated"],
      transactions: json["transactions"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "city": city,
    "email": email,
    "avatar": avatar,
    "creditBalance": creditBalance,
    "articlesRead": articlesRead,
    "favoriteArticles": favoriteArticles,
    "followedAuthors": followedAuthors,
    "campusesMemberOf": campusesMemberOf,
    "coursesEnrolledIn": coursesEnrolledIn,
    "coursesGraduated": coursesGraduated,
    "transactions": transactions,
  };
}