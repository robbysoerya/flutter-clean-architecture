import 'package:portfolio/src/core/error/exceptions.dart';
import 'package:portfolio/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/src/screens/profile/data/datasources/profile_local_datasource.dart';
import 'package:portfolio/src/screens/profile/data/datasources/profile_remote_local_datasource.dart';
import 'package:portfolio/src/screens/profile/data/models/profile_model.dart';
import 'package:portfolio/src/screens/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource profileLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({
    required this.profileLocalDataSource,
    required this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failures, Projects>> fetchProjects() async {
    try {
      final remoteData = await profileRemoteDataSource.getProjects();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
