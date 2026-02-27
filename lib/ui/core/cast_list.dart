import 'package:flutter/material.dart';

import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/ui/core/cast_avatar.dart';

class CastList extends StatelessWidget {
  final List<Cast>? casts;
  final String? errorMessage;

  const CastList({super.key, this.casts, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final bool hasCasts = casts != null && casts!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Casts", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (errorMessage != null) Text(errorMessage!),
        if (hasCasts)
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                if (hasCasts)
                  ...casts!.map(
                    (item) => Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CastAvatar(item),
                              const SizedBox(height: 8),
                              Text(
                                item.name,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
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
