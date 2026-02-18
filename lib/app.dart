import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/config/di.dart';
import 'package:reelhub/routing/router.dart';
import 'package:reelhub/ui/profile/blocs/theme/theme_bloc.dart';

class ReelHub extends StatelessWidget {
  const ReelHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<ThemeBloc>())],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'ReelHub',
            routerConfig: routerInstance,
            theme: ThemeData.light(useMaterial3: true).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black,
                surface: Colors.white,
              ),
              scaffoldBackgroundColor: Colors.white,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: Colors.black.withAlpha(50),
              listTileTheme: ListTileThemeData(
                tileColor: Colors.grey.withValues(alpha: 0.2),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black45,
                unselectedIconTheme: IconThemeData(color: Colors.black45),
                backgroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.white,
                surface: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.black,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: Colors.white.withAlpha(50),
              listTileTheme: ListTileThemeData(
                tileColor: Colors.grey.withValues(alpha: 0.1),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white54,
                unselectedIconTheme: IconThemeData(color: Colors.white54),
              ),
            ),
            themeMode: state.selectedTheme,
          );
        },
      ),
    );
  }
}
