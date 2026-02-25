import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/trailer_player.dart';
import 'package:reelhub/data/blocs/trailers/trailers_bloc.dart';

class TrailerList extends StatelessWidget {
  const TrailerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrailerBloc, TrailerState>(
      builder: (context, state) {
        switch (state.status) {
          case TrailerStatus.initial:
          case TrailerStatus.loading:
            return CircularProgressIndicator.adaptive();
          case TrailerStatus.failure:
            return Text("Error fetching trailers");
          case TrailerStatus.success:
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
                      if (state.items != null && state.items!.isNotEmpty)
                        ...state.items!.map(
                          (item) => Row(
                            children: [
                              SizedBox(width: 300, child: TrailerPlayer(item)),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      if (state.items == null || state.items!.isEmpty)
                        Text("No data"),
                    ],
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
