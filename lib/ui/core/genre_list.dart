import 'package:flutter/material.dart';
import 'package:reelhub/data/models/genre/genre_model.dart';

class GenreList extends StatelessWidget {
  final List<Genre>? genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          
        ],
      ),
    );
  }
}
