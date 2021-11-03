import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/core/utils/constants.dart';
import 'package:portfolio/src/core/utils/sharedpref.dart';
import 'package:portfolio/src/core/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData:
                appThemeData[convertToThemeEnum(SharedPref().getTheme!)]!)) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(PREF_THEME, convertFromThemeEnum(event.themeEnum));
    emit(ThemeState(themeData: appThemeData[event.themeEnum]!));
  }
}
