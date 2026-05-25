import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../models/leaderboard_model.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardEntry entry;
  final int position;

  const LeaderboardTile({super.key, required this.entry, required this.position});

  @override
  Widget build(BuildContext context) {
    Color positionColor;
    if (position == 1) {
      positionColor = AppColors.goldAccent;
    } else if (position == 2) {
      positionColor = Colors.grey.shade300;
    } else if (position == 3) {
      positionColor = Colors.brown.shade300;
    } else {
      positionColor = AppColors.textSecondary;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: entry.isCurrentUser 
            ? AppColors.cyanAccent.withValues(alpha: 0.15)
            : AppColors.cardBgLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: entry.isCurrentUser 
              ? AppColors.cyanAccent 
              : AppColors.borderNeon,
        ),
      ),
      child: Row(
        children: [
          // Position
          SizedBox(
            width: 30,
            child: Text(
              '#$position',
              style: AppTextStyles.orbitronHeading(
                fontSize: 16,
                color: positionColor,
                fontWeight: position <= 3 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Avatar placeholder
          CircleAvatar(
            backgroundColor: AppColors.background,
            radius: 20,
            child: Icon(
              Icons.person, 
              color: position <= 3 ? positionColor : AppColors.cyanAccent,
            ),
          ),
          const SizedBox(width: 12),
          // Name and Level
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.displayName,
                  style: AppTextStyles.rajdhaniBold(
                    color: entry.isCurrentUser ? AppColors.cyanAccent : AppColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Рівень ${entry.level}',
                  style: AppTextStyles.interBody(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Score
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.score}',
                style: AppTextStyles.orbitronHeading(
                  color: position <= 3 ? positionColor : AppColors.textPrimary,
                  fontSize: 18,
                ),
              ),
              const Text(
                'XP',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AllianceLeaderboardTile extends StatelessWidget {
  final AllianceEntry entry;
  final int position;

  const AllianceLeaderboardTile({super.key, required this.entry, required this.position});

  @override
  Widget build(BuildContext context) {
    Color positionColor;
    if (position == 1) {
      positionColor = AppColors.goldAccent;
    } else if (position == 2) {
      positionColor = Colors.grey.shade300;
    } else if (position == 3) {
      positionColor = Colors.brown.shade300;
    } else {
      positionColor = AppColors.textSecondary;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: entry.isUserAlliance 
            ? AppColors.magentaAccent.withValues(alpha: 0.15)
            : AppColors.cardBgLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: entry.isUserAlliance 
              ? AppColors.magentaAccent 
              : AppColors.borderNeon,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '#$position',
              style: AppTextStyles.orbitronHeading(
                fontSize: 16,
                color: positionColor,
                fontWeight: position <= 3 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: AppColors.background,
            radius: 20,
            child: Icon(
              Icons.group, 
              color: position <= 3 ? positionColor : AppColors.magentaAccent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: AppTextStyles.rajdhaniBold(
                    color: entry.isUserAlliance ? AppColors.magentaAccent : AppColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${entry.membersCount} учасників',
                  style: AppTextStyles.interBody(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.totalScore}',
                style: AppTextStyles.orbitronHeading(
                  color: position <= 3 ? positionColor : AppColors.textPrimary,
                  fontSize: 18,
                ),
              ),
              const Text(
                'PTS',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
