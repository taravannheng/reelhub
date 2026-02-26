import 'package:flutter/material.dart';

import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:reelhub/ui/core/trailer_player.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer>? trailers;
  final String? errorMessage;
  final bool isLoading;

  const TrailerList({
    super.key,
    this.trailers,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasTrailers = trailers != null && trailers!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trailers", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (isLoading) CircularProgressIndicator.adaptive(),
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
                      SizedBox(width: 300, child: TrailerPlayer(item, key: UniqueKey())),
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
