import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/src/core/utils/theme.dart';
import 'package:portfolio/src/core/widgets/custom_snackbar.dart';
import 'package:portfolio/src/screens/profile/presentation/bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CustomSnackBar? _snackBar;

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _snackBar =
        CustomSnackBar(key: const Key('snackbar'), scaffoldKey: _scaffoldKey);
    return Scaffold(
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: CustomColor.statusBarColor),
        child: _buildBody(context),
      ),
    );
  }

  BlocBuilder<ProfileBloc, ProfileState> _buildBody(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (prevState, currState) {
        if (currState is ProfileLoadFailure) {
          _snackBar?.showErrorSnackBar(currState.message);
        } else if (currState is ProfileLoadSuccess) {
          _snackBar?.hideAll();
        } else if (currState is ProfileLoadInProgress) {
          _snackBar?.showLoadingSnackBar();
        }
        return currState is! ProfileLoadFailure;
      },
      builder: (context, state) {
        if (state is ProfileLoadSuccess) {
          return ListView.builder(
            itemCount: state.projects.project.length,
            itemBuilder: (context, index) {
              return Text(state.projects.project[index].title);
            },
          );
        }
        return Container();
      },
    );
  }
}
