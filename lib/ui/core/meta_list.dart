import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';

class MetaList extends StatelessWidget {
  final bool? adult;
  final double popularity;
  final String? language;

  const MetaList({
    super.key,
    required this.adult,
    required this.popularity,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (adult != null && adult!)
            Row(
              children: [
                Chip(
                  label: Text(
                    "R",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.red),
                  ),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  side: BorderSide(width: 1, color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          Row(
            children: [
              Chip(
                avatar: SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CustomIcon(
                      path: CustomIcons.fire,
                      color: Colors.green,
                    ),
                  ),
                ),
                label: Text(
                  popularity.toStringAsFixed(2),
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: Colors.green),
                ),
                labelPadding: EdgeInsets.only(right: 8),
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                side: BorderSide(width: 1, color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
          if (language != null && language!.isNotEmpty)
            Row(
              children: [
                Chip(
                  label: Text(
                    language!.toUpperCase(),
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.green),
                  ),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  side: BorderSide(width: 1, color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
        ],
      ),
    );
  }
}
