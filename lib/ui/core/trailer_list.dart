import 'package:flutter/material.dart';

import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:reelhub/ui/core/trailer_player.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer>? trailers;
  final String? errorMessage;

  const TrailerList({super.key, this.trailers, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final bool hasTrailers = trailers != null && trailers!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trailers", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (errorMessage != null) Text(errorMessage!),
        if (hasTrailers)
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...trailers!.map(
                  (item) => Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TrailerPlayer(item, key: ValueKey(item.key)),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                if (!hasTrailers) Text("No data"),
              ],
            ),
          ),
      ],
    );
  }
}
