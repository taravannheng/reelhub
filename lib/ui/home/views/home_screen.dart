import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/home/bloc/trending_bloc.dart';
import 'package:reelhub/ui/home/views/trending_list.dart';
import 'package:reelhub/utils/mock/mock_trending_items.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              BlocBuilder<TrendingBloc, TrendingState>(
                builder: (context, state) {
                  switch (state.status) {
                    case TrendingStatus.loading:
                      return Skeletonizer(
                        enabled: true,
                        child: TrendingList(mockMovieList),
                      );
                    case TrendingStatus.success:
                      return TrendingList(state.items);
                    default:
                      return const Text("No data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
