import 'package:college_for_consciousness/models/user.dart';

Future<User> getMockUser() async {
  return User(
    userId: 1,
    firstName: 'Jane',
    lastName: 'Doe',
    countryCode: 'US',
    city: 'Dallas',
    email: 'noone@nowhere.net',
  );
}