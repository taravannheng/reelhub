class PersonHelpers {
  static String formatBirthDeath(String? birthday, String? deathday) {
    if (birthday == null && deathday == null) return "";

    if (birthday != null && deathday == null) {
      return "Born $birthday";
    }

    if (birthday == null && deathday != null) {
      return "Died $deathday";
    }

    return "$birthday - $deathday";
  }

  static String formatPlaceOfBirth(String? placeOfBirth) {
    return placeOfBirth ?? "";
  }

  static String formatSubtitle({
    String? birthday,
    String? deathday,
    String? placeOfBirth,
  }) {
    final String birthDeathString = formatBirthDeath(birthday, deathday);
    final String placeOfBirthString = formatPlaceOfBirth(placeOfBirth);

    if (birthDeathString.isEmpty && placeOfBirthString.isEmpty) return "";

    if (birthDeathString.isEmpty && placeOfBirthString.isNotEmpty) {
      return placeOfBirthString;
    }

    if (birthDeathString.isNotEmpty && placeOfBirthString.isEmpty) {
      return birthDeathString;
    }

    return [birthDeathString, placeOfBirthString].join(" · ");
  }
}
