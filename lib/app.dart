import 'package:flutter/material.dart';
import 'package:reelhub/routing/router.dart';

class ReelHub extends StatelessWidget {
  const ReelHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ReelHub',
      routerConfig: routerInstance,
      theme: ThemeData(
        primaryColor: Colors.black,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
