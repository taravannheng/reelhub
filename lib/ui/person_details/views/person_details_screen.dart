import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/custom_app_bar.dart';
import 'package:reelhub/ui/core/media_list.dart';
import 'package:reelhub/ui/person_details/blocs/person_details/person_details_bloc.dart';
import 'package:reelhub/ui/person_details/blocs/person_movies/person_movies_bloc.dart';
import 'package:reelhub/ui/person_details/views/person_details_hero.dart';
import 'package:reelhub/ui/person_details/views/person_details_overview.dart';
import 'package:reelhub/utils/mock/mock_media_list.dart';
import 'package:reelhub/utils/mock/mock_person.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: BlocListener<PersonDetailsBloc, PersonDetailsState>(
        listener: (context, state) {
          if (state.status == PersonDetailsStatus.success) {
            context.read<PersonMoviesBloc>().add(
              PersonMoviesFetched(state.item?.imdbId ?? ""),
            );
          }
          if (state.status == PersonDetailsStatus.failure) {
            context.read<PersonMoviesBloc>().add(PersonMoviesFailed());
          }
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<PersonDetailsBloc, PersonDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case PersonDetailsStatus.initial:
                  case PersonDetailsStatus.loading:
                    return Skeletonizer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PersonDetailsHero(
                            profilePath: mockPerson.profilePath,
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: PersonDetailsOverview(person: mockPerson),
                          ),
                        ],
                      ),
                    );
                  case PersonDetailsStatus.failure:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonDetailsHero(profilePath: null),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: PersonDetailsOverview(
                            errorMessage: state.errorMessage,
                          ),
                        ),
                      ],
                    );
                  case PersonDetailsStatus.success:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonDetailsHero(profilePath: state.item?.profilePath),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: PersonDetailsOverview(person: state.item),
                        ),
                      ],
                    );
                }
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<PersonMoviesBloc, PersonMoviesState>(
              builder: (context, state) {
                switch (state.status) {
                  case PersonMoviesStatus.initial:
                  case PersonMoviesStatus.loading:
                    return Skeletonizer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediaList(
                              title: "Appears in",
                              items: mockMediaList,
                            ),
                          ],
                        ),
                      ),
                    );
                  case PersonMoviesStatus.failure:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MediaList(
                        title: 'Appears in',
                        errorMessage: state.errorMessage,
                      ),
                    );
                  case PersonMoviesStatus.success:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediaList(title: "Appears in", items: state.items),
                        ],
                      ),
                    );
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
