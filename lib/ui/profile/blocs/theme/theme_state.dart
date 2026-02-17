part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState(this.selectedTheme);

  final ThemeMode selectedTheme;

  @override
  List<Object?> get props => [selectedTheme];
}
