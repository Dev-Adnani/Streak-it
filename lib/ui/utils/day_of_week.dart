// day_of_week.dart

/// An enum representing days of the week in a Monday-first manner.
/// Monday=0, Tuesday=1, ..., Sunday=6 by default `enum` indexing.
/// We'll provide a .value extension so Monday=1 ... Sunday=7 as well.
enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// Extension to convert DayOfWeek to a 1-based integer value where Monday=1 and Sunday=7.
extension DayOfWeekExtensions on DayOfWeek {
  /// Returns 1-based index for the day:
  /// Monday=1, Tuesday=2, Wednesday=3, Thursday=4,
  /// Friday=5, Saturday=6, Sunday=7
  int get value => index + 1;
}

/// Extension to provide a short 3-letter name for each day of the week.
extension DayOfWeekShortName on DayOfWeek {
  /// Returns a 3-letter code for the day (e.g. "Mon", "Tue", etc.).
  String get shortName {
    switch (this) {
      case DayOfWeek.monday:
        return 'Mon';
      case DayOfWeek.tuesday:
        return 'Tue';
      case DayOfWeek.wednesday:
        return 'Wed';
      case DayOfWeek.thursday:
        return 'Thu';
      case DayOfWeek.friday:
        return 'Fri';
      case DayOfWeek.saturday:
        return 'Sat';
      case DayOfWeek.sunday:
        return 'Sun';
    }
  }
}

/// Converts a 1-based integer to a [DayOfWeek].
/// If the integer is outside 1..7, returns null.
DayOfWeek? dayOfWeekFromInt(int i) {
  switch (i) {
    case 1:
      return DayOfWeek.monday;
    case 2:
      return DayOfWeek.tuesday;
    case 3:
      return DayOfWeek.wednesday;
    case 4:
      return DayOfWeek.thursday;
    case 5:
      return DayOfWeek.friday;
    case 6:
      return DayOfWeek.saturday;
    case 7:
      return DayOfWeek.sunday;
    default:
      return null;
  }
}

/// Converts a string (e.g. "Mon", "Wednesday") to a [DayOfWeek].
/// Returns null if unrecognized.
DayOfWeek? dayOfWeekFromString(String dayString) {
  final lower = dayString.trim().toLowerCase();
  switch (lower) {
    case 'mon':
    case 'monday':
      return DayOfWeek.monday;
    case 'tue':
    case 'tues':
    case 'tuesday':
      return DayOfWeek.tuesday;
    case 'wed':
    case 'wednesday':
      return DayOfWeek.wednesday;
    case 'thu':
    case 'thur':
    case 'thursday':
      return DayOfWeek.thursday;
    case 'fri':
    case 'friday':
      return DayOfWeek.friday;
    case 'sat':
    case 'saturday':
      return DayOfWeek.saturday;
    case 'sun':
    case 'sunday':
      return DayOfWeek.sunday;
    default:
      return null;
  }
}
