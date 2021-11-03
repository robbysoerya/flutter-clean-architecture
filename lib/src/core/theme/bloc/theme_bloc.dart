import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/injection_container.dart';
import 'package:portfolio/src/core/theme/theme.dart';
import 'package:portfolio/src/core/utils/sharedpref.dart';
import 'package:portfolio/src/core/utils/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData:
                appThemeData[convertToThemeEnum(sl<SharedPref>().getTheme)]!)) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    sl<SharedPref>().setTheme(convertFromThemeEnum(event.themeEnum));
    emit(ThemeState(themeData: appThemeData[event.themeEnum]!));
  }
}
