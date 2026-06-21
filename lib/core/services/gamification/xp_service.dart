import 'dart:math' as math;

class XpService {
  static int xpRequiredForLevel(int level) {
    // 500, 1100, 1800, 2600...
    return 500 + (level - 1) * 600 + (level > 5 ? (level - 5) * 400 : 0);
  }

  static double calculateStreakMultiplier(int streak) {
    if (streak >= 30) return 2.0;
    if (streak >= 14) return 1.5;
    if (streak >= 7) return 1.25;
    if (streak >= 3) return 1.1;
    return 1.0;
  }

  static int calculateXpGained({
    required int baseAmount,
    double multiplier = 1.0,
    String? playerClass,
    bool hasXpBoostSkill = false,
  }) {
    double finalMultiplier = multiplier;
    if (playerClass == 'warrior') finalMultiplier += 0.15;
    if (hasXpBoostSkill) finalMultiplier += 0.05;

    return (baseAmount * finalMultiplier).round();
  }
}
