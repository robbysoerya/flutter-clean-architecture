import 'package:portfolio/src/core/network/api_service.dart';
import 'package:portfolio/src/screens/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Projects> getProjects();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Projects> getProjects() async {
    final resp = await apiService.fetchProjects();
    return resp;
  }
}
