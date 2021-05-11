import 'package:college_for_consciousness/models/school.dart';

class Campus {
  Campus({
    this.schools = const <School>[],
});

  List<School> schools;
}