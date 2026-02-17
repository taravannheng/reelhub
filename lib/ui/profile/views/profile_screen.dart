import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/profile/views/theme_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                ThemeList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
