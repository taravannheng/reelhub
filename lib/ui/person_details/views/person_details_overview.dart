import 'package:flutter/material.dart';
import 'package:reelhub/data/models/person/person_model.dart';
import 'package:reelhub/utils/helpers/person_helpers.dart';

class PersonDetailsOverview extends StatelessWidget {
  final Person? person;
  final String? errorMessage;

  const PersonDetailsOverview({super.key, this.person, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final String subtitle = PersonHelpers.formatSubtitle(
      birthday: person?.birthday,
      deathday: person?.deathday,
      placeOfBirth: person?.placeOfBirth,
    );

    if (errorMessage != null) return Text(errorMessage!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          person?.name ?? "N/A",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 4),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.grey),
          ),
        const SizedBox(height: 24),
        Text(
          person?.biography ?? "No biography found...",
          textAlign: TextAlign.left,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
