part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [props];
}

class ThemeChanged extends ThemeEvent {
  final ThemeEnum themeEnum;

  const ThemeChanged({required this.themeEnum});

  @override
  List<Object> get props => [themeEnum];
}
