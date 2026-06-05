import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/providers/l10n.dart';
import '../../../core/providers/providers.dart';
import '../../../core/utils/money_utils.dart';
import '../../../core/widgets/surface_card.dart';
import '../../../core/widgets/loading_skeleton.dart';
import '../../../core/widgets/app_button.dart';
import '../../../data/database.dart';

import '../../gamification/providers/quest_provider.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(questProvider.notifier).completeQuest('view_analytics');
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalsAsync = ref.watch(goalsProvider);
    final depositsAsync = ref.watch(depositsProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.get(locale, 'analytics_title'), style: AppTypography.h1(context)),
            const SizedBox(height: 4),
            Text(AppLocalizations.get(locale, 'analytics_subtitle'), style: AppTypography.body(context)),
            const SizedBox(height: 24.0),
            _buildAllocationBreakdownCard(goalsAsync, locale),
            const SizedBox(height: 20.0),
            _buildTimelineChartCard(depositsAsync, locale),
            const SizedBox(height: 20.0),
            _buildProjectionsSummaryCard(goalsAsync, depositsAsync, locale),
            const SizedBox(height: 20.0),
            AppButton(
              label: AppLocalizations.get(locale, 'stats_title'),
              onPressed: () => context.push('/savings-stats'),
              variant: ButtonVariant.secondary,
              icon: const Icon(Icons.bar_chart_rounded, size: 18),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAllocationBreakdownCard(AsyncValue<List<Goal>> goalsAsync, String locale) {
    return goalsAsync.when(
      loading: () => const SkeletonList(itemCount: 2),
      error: (_, __) => const SizedBox.shrink(),
      data: (goals) {
        if (goals.isEmpty) return const SizedBox.shrink();
        final int total = goals.fold(0, (sum, g) => sum + g.currentAmount);
        final brightness = Theme.of(context).brightness;

        return SurfaceCard(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.get(locale, 'analytics_distribution'), style: AppTypography.h3(context)),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 28,
                        sections: goals.map((g) {
                          final pct = total > 0 ? (g.currentAmount / total * 100) : (100 / goals.length);
                          return PieChartSectionData(
                            color: g.id == 'goal_a' ? AppColors.goalA : AppColors.goalB,
                            value: pct,
                            title: '${pct.toInt()}%',
                            radius: 20,
                            titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textPrimary(brightness)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: goals.map((g) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildLegendItem(g.name, '${formatAmount(g.currentAmount)} ${g.currency}', g.id == 'goal_a' ? AppColors.goalA : AppColors.goalB),
                      )).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(String title, String amount, Color color) {
    return Row(
      children: [
        Container(width: 10.0, height: 10.0, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTypography.bodySmall(context)),
              Text(amount, style: AppTypography.amount(context)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineChartCard(AsyncValue<List<Deposit>> depositsAsync, String locale) {
    return depositsAsync.when(
      loading: () => const SkeletonList(itemCount: 2),
      error: (_, __) => const SizedBox.shrink(),
      data: (deposits) {
        return FutureBuilder<List<List<DepositAllocation>>>(
          future: Future.wait(deposits.map((d) => ref.read(databaseProvider).getAllocationsForDeposit(d.id))),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            final allAllocations = snapshot.data!;
            final timeline = deposits.reversed.toList();
            final allocationsReversed = allAllocations.reversed.toList();

            Map<String, List<FlSpot>> goalSpots = {};
            Map<String, double> cumulative = {};

            for (int i = 0; i < timeline.length; i++) {
              for (var alloc in allocationsReversed[i]) {
                cumulative[alloc.goalId] = (cumulative[alloc.goalId] ?? 0) + centsToDisplay(alloc.amount);
                goalSpots.putIfAbsent(alloc.goalId, () => [const FlSpot(0, 0)]).add(FlSpot((i + 1).toDouble(), cumulative[alloc.goalId]!));
              }
            }

            final brightness = Theme.of(context).brightness;
            final gridColor = AppColors.border(brightness).withValues(alpha: 0.15);

            return SurfaceCard(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.get(locale, 'analytics_dynamics'), style: AppTypography.h3(context)),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    height: 180,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true, drawVerticalLine: false, getDrawingHorizontalLine: (val) => FlLine(color: gridColor, strokeWidth: 1.0)),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: goalSpots.entries.map((e) => LineChartBarData(
                          spots: e.value.length > 8 ? e.value.sublist(e.value.length - 8) : e.value,
                          isCurved: true,
                          color: e.key == 'goal_a' ? AppColors.goalA : AppColors.goalB,
                          barWidth: 2.5,
                          dotData: FlDotData(show: e.value.length < 5),
                          belowBarData: BarAreaData(show: true, color: (e.key == 'goal_a' ? AppColors.goalA : AppColors.goalB).withValues(alpha: 0.06)),
                        )).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProjectionsSummaryCard(AsyncValue<List<Goal>> goalsAsync, AsyncValue<List<Deposit>> depositsAsync, String locale) {
    return goalsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (goals) {
        return depositsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (deposits) {
            return FutureBuilder<List<List<DepositAllocation>>>(
              future: Future.wait(deposits.map((d) => ref.read(databaseProvider).getAllocationsForDeposit(d.id))),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox.shrink();
                final allAllocations = snapshot.data!;
                final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));

                Map<String, double> weeklyTotals = {};
                for (int i = 0; i < deposits.length; i++) {
                  if (deposits[i].createdAt.isAfter(oneWeekAgo)) {
                    for (var alloc in allAllocations[i]) {
                      weeklyTotals[alloc.goalId] = (weeklyTotals[alloc.goalId] ?? 0) + centsToDisplay(alloc.amount);
                    }
                  }
                }

                return SurfaceCard(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppLocalizations.get(locale, 'analytics_projection'), style: AppTypography.h3(context)),
                      const SizedBox(height: 16.0),
                      ...goals.map((g) {
                        final totalWeekly = weeklyTotals[g.id] ?? 0;
                        final remaining = (centsToDisplay(g.targetAmount) - centsToDisplay(g.currentAmount)).clamp(0.0, double.infinity);
                        final rate = totalWeekly / 7.0;
                        final daysRemaining = rate > 0 ? '${(remaining / rate).ceil()}${AppLocalizations.get(locale, 'daily_bonus_days')}' : '∞';
                        return Column(
                          children: [
                            _buildProjectionSummaryRow(g.name, '${totalWeekly.toStringAsFixed(2)} ${g.currency}', daysRemaining, g.id == 'goal_a' ? AppColors.goalA : AppColors.goalB, locale),
                            if (g != goals.last) Divider(color: AppColors.border(Theme.of(context).brightness), height: 24.0),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildProjectionSummaryRow(String goalName, String weeklySum, String expectedDays, Color accentColor, String locale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(goalName, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTypography.bodySmall(context, color: accentColor)),
              const SizedBox(height: 3.0),
              Text('${AppLocalizations.get(locale, 'analytics_weekly_sum')}$weeklySum', style: AppTypography.caption(context)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(AppLocalizations.get(locale, 'analytics_to_100'), style: AppTypography.overline(context)),
            const SizedBox(height: 2.0),
            Text(expectedDays, style: AppTypography.metric(context)),
          ],
        ),
      ],
    );
  }
}
