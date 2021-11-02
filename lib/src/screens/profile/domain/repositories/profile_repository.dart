import 'package:dartz/dartz.dart';
import 'package:portfolio/src/core/error/failures.dart';
import 'package:portfolio/src/screens/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failures, Projects>> fetchProjects();
}
