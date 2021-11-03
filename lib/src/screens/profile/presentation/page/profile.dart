import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/core/theme/bloc/theme_bloc.dart';
import 'package:portfolio/src/core/utils/constants.dart';
import 'package:portfolio/src/core/utils/sharedpref.dart';
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
  ThemeEnum? _themeEnum;
  int? _themeChoice;

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _themeChoice = SharedPref().getTheme!;
    _themeEnum = convertToThemeEnum(_themeChoice!);
    _snackBar =
        CustomSnackBar(key: const Key('snackbar'), scaffoldKey: _scaffoldKey);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
              _buildListProjects(state)
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildListProjects(ProfileLoadSuccess state) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 2 / 1,
            mainAxisExtent: 150,
          ),
          itemCount: state.projects.project.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => launch(state.projects.project[index].link),
                child: Image.network(
                  state.projects.project[index].image,
                  width: 150,
                ));
          }),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                        themeEnum: _themeEnum == ThemeEnum.LightTheme
                            ? ThemeEnum.DarkTheme
                            : ThemeEnum.LightTheme));
                  },
                  icon: _themeEnum == ThemeEnum.LightTheme
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                ),
                CircleAvatar(
                  radius: 96.0,
                  child: ClipOval(
                    child: Image.asset(PROFILE_PHOTO),
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
                  '"In some ways, programming is like painting. You start with a blank canvas and certain basic raw materials. You use a combination of science, art, and craft to determine what to do with them." - Andrew Hunt',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => launch(CV),
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
