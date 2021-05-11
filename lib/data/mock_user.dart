

import 'package:college_for_consciousness/models/user.dart';

Future<User> getMockUser() async {
  return User(
    userId: 1,
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'noone@nowhere.net',
  );
}
