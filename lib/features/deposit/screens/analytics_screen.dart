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
            // Title
            Text(
              AppLocalizations.get(locale, 'analytics_title'),
              style: AppTypography.h1(context),
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.get(locale, 'analytics_subtitle'),
              style: AppTypography.body(context),
            ),
            const SizedBox(height: 24.0),

            // Allocations breakdown (Pie chart)
            _buildAllocationBreakdownCard(goalsAsync, locale),
            const SizedBox(height: 20.0),

            // Timeline Projections Graph (Line Chart)
            _buildTimelineChartCard(depositsAsync, locale),
            const SizedBox(height: 20.0),

            // Projections breakdown card
            _buildProjectionsSummaryCard(goalsAsync, depositsAsync, locale),
            const SizedBox(height: 20.0),

            // Penalty / Avoided Stats link
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

        final total = goals.fold(0, (sum, g) => sum + g.currentAmount);
        final brightnessValue = Theme.of(context).brightness;

        List<PieChartSectionData> sections = [];
        for (int i = 0; i < goals.length; i++) {
          final g = goals[i];
          final double percent = total > 0 ? (g.currentAmount / total * 100) : (100.0 / goals.length);
          final color = g.accentColor.startsWith('#')
              ? Color(int.parse(g.accentColor.replaceFirst('#', '0xFF')))
              : (i == 0 ? AppColors.goalA : AppColors.goalB);

          sections.add(PieChartSectionData(
            color: color,
            value: percent,
            title: '${percent.toInt()}%',
            radius: 20,
            titleStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary(brightnessValue),
            ),
          ));
        }

        final brightness = Theme.of(context).brightness;

        return SurfaceCard(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.get(locale, 'analytics_distribution'),
                style: AppTypography.h3(context),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  // Pie Chart
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 28,
                        sections: sections,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  // Legends
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: goals.asMap().entries.map((e) {
                        final i = e.key;
                        final g = e.value;
                        final color = g.accentColor.startsWith('#')
                            ? Color(int.parse(g.accentColor.replaceFirst('#', '0xFF')))
                            : (i == 0 ? AppColors.goalA : AppColors.goalB);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: _buildLegendItem(
                            g.name,
                            '${formatAmount(g.currentAmount)} ${g.currency}',
                            color,
                          ),
                        );
                      }).toList(),
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
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodySmall(context),
              ),
              Text(
                amount,
                style: AppTypography.amount(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineChartCard(AsyncValue<List<Deposit>> depositsAsync, String locale) {
    final goalsAsync = ref.watch(goalsProvider);

    return depositsAsync.when(
      loading: () => const SkeletonList(itemCount: 2),
      error: (_, __) => const SizedBox.shrink(),
      data: (deposits) {
        return goalsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (goals) {
        // Reverse list to show chronological progression
        final timeline = deposits.reversed.toList();

        // For dynamic N-goals, timeline chart is complex without pre-computed data.
        // Let's show total savings progression for now, or just goal A/B if they exist.
        List<FlSpot> totalSpots = [];
        double cumTotal = 0;
        totalSpots.add(const FlSpot(0, 0));

        for (int i = 0; i < timeline.length; i++) {
          cumTotal += centsToDisplay(timeline[i].amount);
          totalSpots.add(FlSpot((i + 1).toDouble(), cumTotal));
        }

        // Limit spot lengths for chart readability
        if (totalSpots.length > 8) {
          totalSpots = totalSpots.sublist(totalSpots.length - 8);
        }

        final brightness = Theme.of(context).brightness;
        final gridColor = AppColors.border(brightness).withValues(alpha: 0.15);

        return SurfaceCard(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.get(locale, 'analytics_dynamics'),
                style: AppTypography.h3(context),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                height: 180,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (val) => FlLine(
                        color: gridColor,
                        strokeWidth: 1.0,
                      ),
                    ),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: totalSpots,
                        isCurved: true,
                        color: AppColors.accent,
                        barWidth: 2.5,
                        dotData: FlDotData(show: totalSpots.length < 5),
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.accent.withValues(alpha: 0.06),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
          }
        );
      },
    );
  }

  Widget _buildProjectionsSummaryCard(
    AsyncValue<List<Goal>> goalsAsync,
    AsyncValue<List<Deposit>> depositsAsync,
    String locale,
  ) {
    return goalsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (goals) {
        if (goals.isEmpty) return const SizedBox.shrink();

        return depositsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (deposits) {
            return FutureBuilder<Map<String, double>>(
              future: Future.microtask(() async {
                Map<String, double> weeklyMap = {};
                final now = DateTime.now();
                final oneWeekAgo = now.subtract(const Duration(days: 7));

                for (var dep in deposits) {
                  if (dep.createdAt.isAfter(oneWeekAgo)) {
                    final allocs = await ref.read(databaseProvider).getAllocationsForDeposit(dep.id);
                    for (var a in allocs) {
                      weeklyMap[a.goalId] = (weeklyMap[a.goalId] ?? 0) + centsToDisplay(a.amount);
                    }
                  }
                }
                return weeklyMap;
              }),
              builder: (context, snapshot) {
                final weeklyMap = snapshot.data ?? {};

            return SurfaceCard(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.get(locale, 'analytics_projection'),
                    style: AppTypography.h3(context),
                  ),
                  const SizedBox(height: 16.0),
                  ...goals.asMap().entries.map((e) {
                    final i = e.key;
                    final g = e.value;
                    final weeklySum = weeklyMap[g.id] ?? 0.0;
                    final rate = weeklySum / 7.0;
                    final remaining = (centsToDisplay(g.targetAmount) - centsToDisplay(g.currentAmount)).clamp(0, double.infinity);
                    final expectedDays = rate > 0 ? '${(remaining / rate).ceil()}${AppLocalizations.get(locale, 'daily_bonus_days')}' : '∞';

                    final color = g.accentColor.startsWith('#')
                        ? Color(int.parse(g.accentColor.replaceFirst('#', '0xFF')))
                        : (i == 0 ? AppColors.goalA : AppColors.goalB);

                    return Column(
                      children: [
                        if (i > 0) Divider(
                          color: AppColors.border(Theme.of(context).brightness),
                          height: 24.0,
                        ),
                        _buildProjectionSummaryRow(
                          g.name,
                          '${weeklySum.toStringAsFixed(2)} ${g.currency}',
                          expectedDays,
                          color,
                          locale,
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            );
              }
            );
          },
        );
      },
    );
  }

  Widget _buildProjectionSummaryRow(
    String goalName,
    String weeklySum,
    String expectedDays,
    Color accentColor,
    String locale,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goalName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodySmall(context, color: accentColor),
              ),
              const SizedBox(height: 3.0),
              Text(
                '${AppLocalizations.get(locale, 'analytics_weekly_sum')}$weeklySum',
                style: AppTypography.caption(context),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppLocalizations.get(locale, 'analytics_to_100'),
              style: AppTypography.overline(context),
            ),
            const SizedBox(height: 2.0),
            Text(
              expectedDays,
              style: AppTypography.metric(context),
            ),
          ],
        ),
      ],
    );
  }
}
