import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/core/utils/constants.dart';
import 'package:portfolio/src/core/utils/theme.dart';
import 'package:portfolio/src/core/widgets/custom_snackbar.dart';
import 'package:portfolio/src/screens/profile/presentation/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.cyan[100],
      key: _scaffoldKey,
      body: _buildBody(context),
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
          return ListView(
            children: [
              _buildHeader(),
              const SizedBox(height: 24.0),
              Text(
                'Recent projects',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 24.0),
              _buildListProjects(state),
              const SizedBox(height: 24.0),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildListProjects(ProfileLoadSuccess state) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: state.projects.project.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => launch(state.projects.project[index].link),
            child: Card(
              color: Colors.red[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.projects.project[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: CustomColor.white),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
      color: CustomColor.white,
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 96.0,
                  child: ClipOval(
                    child: Image.asset('assets/images/me.jpeg'),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Hi, I am Robby,\nMobile Engineer',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Download CV'),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.instagram),
                        onPressed: () => launch(INSTAGRAM)),
                    const SizedBox(width: 8.0),
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.github),
                        onPressed: () => launch(GITHUB)),
                    const SizedBox(width: 8.0),
                    IconButton(
                        icon: const Icon(FontAwesomeIcons.linkedin),
                        onPressed: () => launch(LINKEDIN)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
