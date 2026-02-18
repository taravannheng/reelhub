import 'package:flutter/material.dart';
import 'package:reelhub/utils/constants/image_constants.dart';

class CustomLogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const CustomLogoAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leadingWidth: 56,
      leading: Container(
        padding: EdgeInsets.only(left: 16),
        child: Image.asset(
          CustomImages.logoGrayScaleTransparent,
          fit: BoxFit.contain,
        ),
      ),
      shape: Border(
        bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
