import 'package:flutter/material.dart';
import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:reelhub/ui/movie_details/views/trailer_player.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer> trailers;

  const TrailerList(this.trailers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trailers", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...trailers.map(
                (item) => Row(
                  children: [
                    SizedBox(width: 300, child: TrailerPlayer(item)),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
