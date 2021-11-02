import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/src/core/utils/theme.dart';
import 'package:portfolio/src/screens/profile/presentation/bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: CustomColor.statusBarColor),
        child: _buildBody(context),
      ),
    );
  }

  BlocBuilder<ProfileBloc, ProfileState> _buildBody(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadSuccess) {
          return ListView.builder(
            itemCount: state.projects.project.length,
            itemBuilder: (context, index) {
              return Text(state.projects.project[index].title);
            },
          );
        } else if (state is ProfileLoadInProgress) {
          return const CircularProgressIndicator();
        }
        return const Text('Failed');
      },
    );
  }
}
