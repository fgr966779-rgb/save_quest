import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// Clean allocation slider between two goals.
/// Replaces old SplitSlider. No Orbitron font.
class GoalAllocation {
  final String id;
  final String name;
  final double percent;
  final Color color;

  const GoalAllocation({
    required this.id,
    required this.name,
    required this.percent,
    required this.color,
  });
}

class SplitSlider extends StatelessWidget {
  final List<GoalAllocation> allocations;
  final ValueChanged<double> onGoalAChanged;

  const SplitSlider({
    super.key,
    required this.allocations,
    required this.onGoalAChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Currently specialized for 2 goals for UI simplicity, but logic supports more if needed
    final goalA = allocations.isNotEmpty ? allocations[0] : null;
    final goalB = allocations.length > 1 ? allocations[1] : null;

    if (goalA == null || goalB == null) return const SizedBox.shrink();

    final percentA = goalA.percent.toInt();
    final percentB = goalB.percent.toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(goalA.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTypography.caption(context)),
                  const SizedBox(height: 2),
                  Text('$percentA%', style: AppTypography.metric(context, color: goalA.color)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(goalB.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTypography.caption(context)),
                  const SizedBox(height: 2),
                  Text('$percentB%', style: AppTypography.metric(context, color: goalB.color)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  colors: [goalA.color, goalB.color],
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              ),
              child: Slider(
                value: goalA.percent / 100.0,
                onChanged: onGoalAChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
