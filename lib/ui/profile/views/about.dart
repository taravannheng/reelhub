import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("About"),
        ),
        const SizedBox(height: 8.0),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          onTap: () {
            Scaffold.of(context).showBottomSheet(
              (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 0.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "This application uses TMDB and the TMDB APIs but is not endorsed, certified, or otherwise approved by TMDB.",
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                );
              },
              backgroundColor: Theme.of(
                context,
              ).bottomSheetTheme.backgroundColor,
              showDragHandle: true,
              enableDrag: true,
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 0,
              ),
            );
          },
          title: Text("License"),
        ),
      ],
    );
  }
}
