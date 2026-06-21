import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// Clean concentric dual progress rings. No glow, no shimmer.
/// Replaces old DualProgressRing.
class GoalProgressData {
  final double progress;
  final Color color;
  final String label;

  const GoalProgressData({
    required this.progress,
    required this.color,
    required this.label,
  });
}

class DualProgressRing extends StatelessWidget {
  final List<GoalProgressData> goals;
  final double size;
  final double strokeWidth;
  final double ringSpacing;
  final String centerLabel;

  const DualProgressRing({
    super.key,
    required this.goals,
    this.size = 200.0,
    this.strokeWidth = 14.0,
    this.ringSpacing = 12.0,
    this.centerLabel = '',
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final compositeProgress = goals.isEmpty ? 0 : (goals.fold(0.0, (sum, g) => sum + g.progress) / goals.length * 100).toInt();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _ConcentricRingPainter(
              goals: goals,
              strokeWidth: strokeWidth,
              ringSpacing: ringSpacing,
              brightness: brightness,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(centerLabel.isNotEmpty ? centerLabel : 'СПІЛЬНО', style: AppTypography.overline(context)),
              const SizedBox(height: 2),
              Text('$compositeProgress%', style: AppTypography.metric(context, fontSize: goals.length > 2 ? 20 : 24)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                alignment: WrapAlignment.center,
                children: goals.map((g) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: g.color)),
                    const SizedBox(width: 4),
                    Text('${(g.progress * 100).toInt()}%', style: AppTypography.caption(context, color: g.color)),
                  ],
                )).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConcentricRingPainter extends CustomPainter {
  final List<GoalProgressData> goals;
  final double strokeWidth;
  final double ringSpacing;
  final Brightness brightness;

  _ConcentricRingPainter({
    required this.goals,
    required this.strokeWidth,
    required this.ringSpacing,
    required this.brightness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const startAngle = -math.pi / 2;
    final trackColor = AppColors.border(brightness).withValues(alpha: 0.3);

    for (int i = 0; i < goals.length; i++) {
      final radius = (size.width / 2) - (strokeWidth / 2) - (i * (strokeWidth + ringSpacing));
      if (radius <= 0) break;

      final rect = Rect.fromCircle(center: center, radius: radius);

      // Track
      canvas.drawCircle(center, radius, Paint()..color = trackColor..style = PaintingStyle.stroke..strokeWidth = strokeWidth);

      // Active
      if (goals[i].progress > 0.005) {
        canvas.drawArc(
          rect,
          startAngle,
          2 * math.pi * goals[i].progress.clamp(0, 1),
          false,
          Paint()..color = goals[i].color..style = PaintingStyle.stroke..strokeWidth = strokeWidth..strokeCap = StrokeCap.round,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ConcentricRingPainter oldDelegate) => true;
}
