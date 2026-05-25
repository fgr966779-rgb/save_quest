import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/providers/providers.dart';

class NeuralCalibrationDialog extends ConsumerStatefulWidget {
  const NeuralCalibrationDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const NeuralCalibrationDialog(),
    );
  }

  @override
  ConsumerState<NeuralCalibrationDialog> createState() => _NeuralCalibrationDialogState();
}

class _NeuralCalibrationDialogState extends ConsumerState<NeuralCalibrationDialog> {
  int _score = 0;
  final int _targetScore = 5;
  double _circleX = 0;
  double _circleY = 0;
  final math.Random _random = math.Random();
  bool _isFinished = false;
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _moveCircle();
    _startTime = DateTime.now();
  }

  void _moveCircle() {
    setState(() {
      _circleX = _random.nextDouble() * 2 - 1; // -1 to 1
      _circleY = _random.nextDouble() * 2 - 1; // -1 to 1
    });
  }

  void _onTap() {
    HapticFeedback.lightImpact();
    setState(() {
      _score++;
      if (_score >= _targetScore) {
        _isFinished = true;
        _grantBonus();
      } else {
        _moveCircle();
      }
    });
  }

  Future<void> _grantBonus() async {
    final db = ref.read(databaseProvider);
    final profile = await db.getUserProfile();
    if (profile != null) {
      // Grant a small XP bonus for calibration
      await db.insertUserProfile(profile.copyWith(xp: profile.xp + 50));
      // ignore: unused_result
      ref.refresh(userProfileProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.cyanAccent.withOpacity(0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.cyanAccent.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: _isFinished ? _buildSuccess() : _buildGame(),
        ),
      ),
    );
  }

  Widget _buildGame() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'NEURAL CALIBRATION',
          style: AppTextStyles.orbitronHeading(
            fontSize: 16,
            color: AppColors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'SYNCHRONIZING: $_score / $_targetScore',
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Grid background
                Positioned.fill(
                  child: CustomPaint(
                    painter: _GridPainter(),
                  ),
                ),
                // Target circle
                Align(
                  alignment: Alignment(_circleX, _circleY),
                  child: GestureDetector(
                    onTap: _onTap,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cyanAccent.withOpacity(0.2),
                        border: Border.all(color: AppColors.cyanAccent, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cyanAccent.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.gps_fixed, color: AppColors.cyanAccent, size: 30),
                      ),
                    ).animate(key: ValueKey(_score)).scale(duration: 200.ms, curve: Curves.easeOutBack),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'ТАПНІТЬ ПО ЦІЛІ ДЛЯ СИНХРОНІЗАЦІЇ',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.verified_user, color: AppColors.cyanAccent, size: 80)
            .animate()
            .scale(duration: 500.ms, curve: Curves.elasticOut),
        const SizedBox(height: 24),
        Text(
          'CALIBRATION COMPLETE',
          style: AppTextStyles.orbitronHeading(fontSize: 18, color: AppColors.cyanAccent),
        ),
        const SizedBox(height: 12),
        const Text(
          '+50 XP Отримано',
          style: TextStyle(color: AppColors.goldGlow, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        NeonButton(
          text: 'ВХІД У СИСТЕМУ',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.cyanAccent.withOpacity(0.1)
      ..strokeWidth = 1.0;

    for (double i = 0; i <= size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i <= size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
