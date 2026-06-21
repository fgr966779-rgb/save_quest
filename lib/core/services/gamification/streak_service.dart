import 'dart:math' as math;

class StreakService {
  static Map<String, dynamic> calculateStreak({
    required DateTime? lastDepositDate,
    required int currentStreak,
    required int maxStreak,
    required int freezeTokens,
    String? playerClass,
    Set<String> unlockedSkillIds = const {},
  }) {
    if (lastDepositDate == null) {
      return {
        'streak': 1,
        'maxStreak': math.max(maxStreak, 1),
        'freezeUsed': false,
        'freezeTokens': freezeTokens,
      };
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final last = DateTime(lastDepositDate.year, lastDepositDate.month, lastDepositDate.day);
    final diff = today.difference(last).inDays;

    if (diff <= 0) {
      // Already deposited today
      return {
        'streak': currentStreak,
        'maxStreak': maxStreak,
        'freezeUsed': false,
        'freezeTokens': freezeTokens,
      };
    } else if (diff == 1) {
      // Consecutive day
      final newStreak = currentStreak + 1;
      return {
        'streak': newStreak,
        'maxStreak': math.max(maxStreak, newStreak),
        'freezeUsed': false,
        'freezeTokens': freezeTokens,
      };
    } else {
      // Missed one or more days
      bool canUseShield = unlockedSkillIds.contains('streak_shield') && diff == 2;

      if (canUseShield) {
         return {
          'streak': currentStreak + 1,
          'maxStreak': math.max(maxStreak, currentStreak + 1),
          'freezeUsed': false,
          'freezeTokens': freezeTokens,
        };
      }

      if (freezeTokens > 0) {
        return {
          'streak': currentStreak, // Keep current streak
          'maxStreak': maxStreak,
          'freezeUsed': true,
          'freezeTokens': freezeTokens - 1,
        };
      } else {
        return {
          'streak': 1,
          'maxStreak': maxStreak,
          'freezeUsed': false,
          'freezeTokens': 0,
        };
      }
    }
  }
}
