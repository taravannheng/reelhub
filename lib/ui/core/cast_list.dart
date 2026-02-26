import 'package:flutter/material.dart';

import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/ui/core/cast_avatar.dart';

class CastList extends StatelessWidget {
  final List<Cast>? casts;
  final String? errorMessage;
  final bool isLoading;

  const CastList({
    super.key,
    this.casts,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasCasts = casts != null && casts!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Casts", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (isLoading) CircularProgressIndicator.adaptive(),
        if (errorMessage != null) Text(errorMessage!),
        if (hasCasts)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                if (hasCasts)
                  ...casts!.map(
                    (item) => Row(
                      children: [
                        SizedBox(width: 100, child: CastAvatar(item)),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                if (!hasCasts) Text("No Data"),
              ],
            ),
          ),
      ],
    );
  }
}
