import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("home screen..."),
        ),
      ),
    );
  }
}
