

import 'package:college_for_consciousness/utils/enums.dart';

class Avatar {
  Avatar ({
    required this.avatarId,
    required this.avatarName,
    required this.pathToAsset,
    required this.category,
});
  int avatarId;
  String avatarName;
  String pathToAsset;
  AvatarType category;
}