import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrailerListSkeleton extends StatelessWidget {
  const TrailerListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trailers", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(width: 300, height: 170, color: Colors.white),
                const SizedBox(width: 16),
                Container(width: 300, height: 170, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
