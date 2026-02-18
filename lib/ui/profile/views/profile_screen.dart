import 'package:flutter/material.dart';

import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/profile/views/about.dart';
import 'package:reelhub/ui/profile/views/theme_list.dart';
import 'package:reelhub/utils/helpers/version_helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32.0),
                      ThemeList(),
                      const SizedBox(height: 24.0),
                      About(),
                      const SizedBox(height: 24.0),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: VersionHelpers.getVersion(),
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    snapshot.data == null ? "" : "Version ${snapshot.data}",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                  ),
                );
              },
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
