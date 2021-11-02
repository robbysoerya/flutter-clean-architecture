import 'package:dartz/dartz.dart';
import 'package:portfolio/src/core/error/failures.dart';
import 'package:portfolio/src/core/usecases/usecase.dart';
import 'package:portfolio/src/screens/profile/data/models/profile_model.dart';
import 'package:portfolio/src/screens/profile/domain/repositories/profile_repository.dart';

class FetchProjects implements Usecase<Projects, NoParams> {
  final ProfileRepository profileRepository;

  FetchProjects({required this.profileRepository});

  @override
  Future<Either<Failures, Projects>> call(_) async {
    return await profileRepository.fetchProjects();
  }
}
