part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ThemeSelected extends ThemeEvent {
  final ThemeMode selectedTheme;

  const ThemeSelected(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}
