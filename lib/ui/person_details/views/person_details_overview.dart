import 'package:flutter/material.dart';
import 'package:reelhub/data/models/person/person_model.dart';

class PersonDetailsOverview extends StatelessWidget {
  final Person? person;
  final String? errorMessage;

  const PersonDetailsOverview({super.key, this.person, this.errorMessage});

  @override
  Widget build(BuildContext context) {
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
        Text(
          "${person?.birthday ?? ""} - ${person?.deathday ?? "Present"}${person?.placeOfBirth == null ? "" : " · ${person?.placeOfBirth}"}",
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
