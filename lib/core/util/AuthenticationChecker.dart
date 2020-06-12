import 'package:dartz/dartz.dart';

class CheckAuthentication {
  Either<String, bool> checkLoginAuthentication(String f_name, String l_name,
      String p_number, String id, String gender, String dob) {
    if (f_name == null || f_name.length < 3) {
      return Left("First Name Error");
    } else if (l_name == null || l_name.length < 3) {
      return Left("Surname Error");
    } else if (p_number == null || p_number.length < 3) {
      return Left("Phone Number Error");
    } else if (id == null || id.length < 6) {
      return Left("National Id Error");
    } else if (gender == null) {
      return Left("Choose Gende");
    } else if (dob == null) {
      return Left("Date of birth Error");
    } else {
      return Right(true);
    }
  }
}
