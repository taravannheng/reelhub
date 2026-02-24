import 'package:flutter/material.dart';
import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/ui/movie_details/views/cast_card.dart';

class CastList extends StatelessWidget {
  final List<Cast> casts;

  const CastList(this.casts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Casts", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...casts.map(
                (item) => Row(
                  children: [
                    SizedBox(width: 100, child: CastCard(item)),
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
