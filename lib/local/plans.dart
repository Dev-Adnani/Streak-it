class Plans {
  // Plan Types
  static const String free = 'free';
  static const String premium = 'premium';

  // Habit Limits
  static const Map<String, int> habitLimits = {
    free: 3, // Maximum habits for the free plan
    premium: 6, // Maximum habits for the premium plan
  };

  // Completion Limits per Day per Habit
  static const Map<String, int> completionLimits = {
    free: 10, // Maximum completions per habit per day for free
    premium: 20, // Maximum completions per habit per day for premium
  };

  // Utility Methods
  /// Get the habit limit for a given plan type
  static int getHabitLimit(String planType) => habitLimits[planType] ?? 0;

  /// Get the completion limit for a given plan type
  static int getCompletionLimit(String planType) =>
      completionLimits[planType] ?? 0;

  /// Check if a plan type is valid
  static bool isValidPlan(String planType) => habitLimits.containsKey(planType);
}
