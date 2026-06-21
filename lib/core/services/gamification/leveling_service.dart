import '../../../data/database.dart';
import 'xp_service.dart';

class LevelingService {
  static (int level, bool leveledUp) calculateNewLevel({
    required int currentLevel,
    required int totalXp,
  }) {
    int level = currentLevel;
    bool leveledUp = false;

    while (totalXp >= XpService.xpRequiredForLevel(level)) {
      level++;
      leveledUp = true;
    }

    return (level, leveledUp);
  }

  static int calculateSkillPoints(int oldLevel, int newLevel, int currentPoints) {
    return currentPoints + (newLevel - oldLevel);
  }
}
