import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.system)) {
    on<ThemeSelected>(_onThemeSelected);
  }

  Future<void> _onThemeSelected(
    ThemeSelected event,
    Emitter<ThemeState> emit,
  ) async {
    if (event.selectedTheme == state.selectedTheme) return;
    emit(ThemeState(event.selectedTheme));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      final themeMode = ThemeMode.values[json['themeMode'] as int];
      return ThemeState(themeMode);
    } catch (e) {
      return ThemeState(ThemeMode.system);
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    try {
      return {'themeMode': state.selectedTheme.index};
    } catch (e) {
      return {'themeMode': 2}; // returning ThemeMode.system
    }
  }
}
