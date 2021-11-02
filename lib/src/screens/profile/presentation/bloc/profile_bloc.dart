import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/src/core/usecases/usecase.dart';
import 'package:portfolio/src/screens/profile/data/models/profile_model.dart';
import 'package:portfolio/src/screens/profile/domain/usecases/profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchProjects fetchProjects;

  ProfileBloc({required this.fetchProjects}) : super(ProfileInitial()) {
    on<ProfileStarted>(_onProfileStarted);
  }

  void _onProfileStarted(
      ProfileStarted event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadInProgress());
    final resp = await fetchProjects.call(NoParams());
    final updateState = resp.fold(
        (l) => const ProfileLoadFailure(message: 'Coba lagi'),
        (r) => ProfileLoadSuccess(projects: r));

    emit(updateState);
  }
}
