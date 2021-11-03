part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [props];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadInProgress extends ProfileState {}

class ProfileLoadSuccess extends ProfileState {
  final Projects projects;

  const ProfileLoadSuccess({required this.projects});

  @override
  List<Object> get props => [projects];
}

class ProfileLoadFailure extends ProfileState {
  final String message;

  const ProfileLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
