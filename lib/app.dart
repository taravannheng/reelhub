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
              listTileTheme: ListTileThemeData(
                tileColor: Colors.grey.withValues(alpha: 0.2),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black45,
                unselectedIconTheme: IconThemeData(color: Colors.black45),
              ),
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
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
