

import 'package:college_for_consciousness/models/user_model.dart';

Future<UserModel> getMockUser() async {
  return UserModel(
    userId: 1,
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'noone@nowhere.net',
  );
}
