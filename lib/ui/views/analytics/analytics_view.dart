import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/analytics/analytics_shimmer.dart';
import 'package:streakit/ui/views/analytics/widgets/animated_metric_row.dart';
import 'package:streakit/ui/views/analytics/widgets/animated_section_header.dart';
import 'package:streakit/ui/views/analytics/widgets/metric_card.dart';
import 'package:streakit/ui/views/analytics/widgets/graphs/monthly_graph.dart';
import 'package:streakit/ui/views/analytics/widgets/graphs/streak_trends.dart';
import 'package:streakit/ui/views/analytics/widgets/graphs/weekly_graph.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'analytics_viewmodel.dart';

class AnalyticsView extends StackedView<AnalyticsViewModel> {
  const AnalyticsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AnalyticsViewModel viewModel,
    Widget? child,
  ) {
    final habits = viewModel.habits;
    final selectedHabit = viewModel.selectedHabit;
    final habitMetrics = viewModel.habitMetrics;
    final monthlyCompletions = viewModel.monthlyCompletions;
    final weeklyCompletions = viewModel.weeklyCompletions;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: const CustomAppBar(
        title: "Analytics",
        iconData: IconlyLight.graph,
        iconColor: AppColors.iceBlue,
      ),
      body: SafeArea(
        bottom: false,
        child: Builder(
          builder: (context) {
            if (viewModel.isLoading) {
              return AnalyticsShimmer();
            }

            if (viewModel.hasError) {
              return const Center(
                child: Text(
                  "An error occurred",
                  style: TextStyle(color: AppColors.iceBlue),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (habits.isEmpty) {
              return const Center(
                child: Text(
                  "No habits to analyze",
                  style: TextStyle(color: AppColors.iceBlue),
                  textAlign: TextAlign.center,
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpaceBox.s8,
                        const AnimatedSectionHeader(title: "Select a Habit"),
                        VerticalSpaceBox.s5,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppColors.creamColor,
                            ),
                          ),
                          child: DropdownButton<Habit>(
                            dropdownColor: AppColors.blackColor,
                            hint: const Text(
                              "Select a habit",
                              style: TextStyle(color: AppColors.creamColor),
                            ),
                            value: habits.contains(selectedHabit)
                                ? selectedHabit
                                : null,
                            isExpanded: true,
                            items: habits.map((habit) {
                              return DropdownMenuItem<Habit>(
                                value: habit,
                                child: Text(
                                  habit.habitName ?? "Unnamed Habit",
                                  style:
                                      const TextStyle(color: AppColors.iceBlue),
                                ),
                              );
                            }).toList(),
                            onChanged: (Habit? habit) {
                              if (habit != null) {
                                viewModel.onSelectHabit(habit);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 140.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpaceBox.s16,

                        // Show Analytics if data is sufficient
                        if (viewModel.hasSufficientData) ...[
                          // Monthly Metrics and Graph
                          const AnimatedSectionHeader(
                              title: "Monthly Completions"),
                          VerticalSpaceBox.s16,
                          if (monthlyCompletions.isNotEmpty) ...[
                            AnimatedMetricsRow(
                              metrics: [
                                MetricCard(
                                  title: "Best Month",
                                  value: habitMetrics?.bestMonth ?? "N/A",
                                ),
                                MetricCard(
                                  title: "Total Completions",
                                  value: habitMetrics?.totalCompletions
                                          .toString() ??
                                      "N/A",
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s32,
                            MonthlyCompletionsGraph(
                              completions: monthlyCompletions
                                  .map((data) => data.completions)
                                  .toList(),
                              months: monthlyCompletions
                                  .map((data) => data.month)
                                  .toList(),
                            ),
                          ],

                          VerticalSpaceBox.s32,

                          // Streak Metrics and Graph
                          const AnimatedSectionHeader(title: "Streak Trends"),
                          VerticalSpaceBox.s16,
                          if (habitMetrics != null) ...[
                            AnimatedMetricsRow(
                              metrics: [
                                MetricCard(
                                  title: "Current Streak",
                                  value: "${habitMetrics.currentStreak} days",
                                ),
                                MetricCard(
                                  title: "Best Streak",
                                  value: "${habitMetrics.bestStreak} days",
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s32,
                            StreakTrendsGraph(
                              streaks: weeklyCompletions
                                  .map((data) => data.completions)
                                  .toList(),
                              days: weeklyCompletions
                                  .map((data) => data.day)
                                  .toList(),
                            ),
                          ],

                          VerticalSpaceBox.s32,

                          // Weekly Metrics and Graph
                          const AnimatedSectionHeader(title: "Weekly Trends"),
                          VerticalSpaceBox.s16,
                          if (weeklyCompletions.isNotEmpty) ...[
                            AnimatedMetricsRow(
                              metrics: [
                                MetricCard(
                                  title: "Most Active Day",
                                  value: weeklyCompletions
                                      .reduce((a, b) =>
                                          a.completions > b.completions ? a : b)
                                      .day,
                                ),
                                MetricCard(
                                  title: "Avg Weekly",
                                  value: (weeklyCompletions.fold(
                                              0,
                                              (sum, item) =>
                                                  sum + item.completions) ~/
                                          weeklyCompletions.length)
                                      .toString(),
                                ),
                              ],
                            ),
                            VerticalSpaceBox.s32,
                            WeeklyTrendsGraph(
                              completions: weeklyCompletions
                                  .map((data) => data.completions)
                                  .toList(),
                              days: weeklyCompletions
                                  .map((data) => data.day)
                                  .toList(),
                            ),
                          ],
                        ]
                      ],
                    ),
                  ),
                ),
                if (!viewModel.hasSufficientData)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      // Updated for centering
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures the content is centered
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline_outlined,
                              color: AppColors.yellowish,
                              size: 32.0,
                            ),
                            VerticalSpaceBox.s5,
                            const Text(
                              "Insufficient data to show analytics",
                              style: TextStyle(color: AppColors.iceBlue),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  AnalyticsViewModel viewModelBuilder(BuildContext context) =>
      AnalyticsViewModel();
}
