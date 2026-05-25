import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Shimmer skeleton placeholder used while content is loading.
///
/// Pure Animation/Gradient — no extra dependency. Respects reduceMotion via
/// [MediaQuery.disableAnimations] so users with motion sensitivity see a flat
/// surface instead of a sweeping highlight.
class SkeletonBlock extends StatefulWidget {
  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  const SkeletonBlock({
    Key? key,
    this.width,
    this.height = 16.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<SkeletonBlock> createState() => _SkeletonBlockState();
}

class _SkeletonBlockState extends State<SkeletonBlock>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _animating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
  }

  void _syncAnimationState(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      if (_animating) {
        _controller.stop();
        _animating = false;
      }
      return;
    }
    if (!_animating) {
      _controller.repeat();
      _animating = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _syncAnimationState(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark
        ? AppColors.cardBgLight.withOpacity(0.6)
        : AppColors.lightSurfaceMuted;
    final highlight = isDark
        ? Colors.white.withOpacity(0.06)
        : Colors.white.withOpacity(0.8);
    final radius = widget.borderRadius ?? BorderRadius.circular(8.0);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value; // 0..1
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: base,
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment(-1.0 + 2.0 * t, 0),
              end: Alignment(0.0 + 2.0 * t, 0),
              colors: [
                base,
                highlight,
                base,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }
}
