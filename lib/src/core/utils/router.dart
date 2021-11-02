import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/injection_container.dart';
import 'package:portfolio/src/core/utils/constants.dart';
import 'package:portfolio/src/screens/profile/presentation/bloc/profile_bloc.dart';
import 'package:portfolio/src/screens/profile/presentation/page/profile.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ProfileBloc>(
                  create: (_) => sl<ProfileBloc>(),
                  child: const ProfilePage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ProfileBloc>(
                  create: (_) => sl<ProfileBloc>(),
                  child: const ProfilePage(),
                ));
    }
  }
}
