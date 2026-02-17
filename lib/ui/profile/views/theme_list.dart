import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/ui/profile/blocs/theme/theme_bloc.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';

class ThemeList extends StatelessWidget {
  const ThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Themes"),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              title: Text("Light"),
              trailing: state.selectedTheme == ThemeMode.light
                  ? CustomIcon(path: CustomIcons.check)
                  : null,
              onTap: () {
                context.read<ThemeBloc>().add(ThemeSelected(ThemeMode.light));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              title: Text("Dark"),
              trailing: state.selectedTheme == ThemeMode.dark
                  ? CustomIcon(path: CustomIcons.check)
                  : null,
              onTap: () {
                context.read<ThemeBloc>().add(ThemeSelected(ThemeMode.dark));
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: Text("System"),
              trailing: state.selectedTheme == ThemeMode.system
                  ? CustomIcon(path: CustomIcons.check)
                  : null,
              onTap: () {
                context.read<ThemeBloc>().add(ThemeSelected(ThemeMode.system));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
