import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/cast_avatar.dart';
import 'package:reelhub/data/blocs/casts/casts_bloc.dart';

class CastList extends StatelessWidget {
  const CastList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        final bool hasCasts = state.items != null && state.items!.isNotEmpty;

        switch (state.status) {
          case CastStatus.initial:
          case CastStatus.loading:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Casts", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                CircularProgressIndicator.adaptive(),
              ],
            );
          case CastStatus.failure:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Casts", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text("Error fetching casts"),
              ],
            );
          case CastStatus.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Casts", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (hasCasts)
                        ...state.items!.map(
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
      },
    );
  }
}
