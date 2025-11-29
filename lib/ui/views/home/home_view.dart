import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/views/home/widget/rounded_bach.dart';
import 'package:streakit/ui/views/streak_ui/widget/month_shimmer_view.dart';
import 'package:streakit/ui/views/home/widget/tabSelector/home_tab_selector.dart';
import 'package:streakit/ui/views/streak_ui/month_streak_view.dart';
import 'package:streakit/ui/views/streak_ui/week_streak_view.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: "Home",
        iconData: IconlyLight.home,
        iconColor: AppColors.iceBlue,
        children: [
          HomeTabSelector(
            selectedIndex: viewModel.tabSelectedIndexSelected,
            onTabSelected: viewModel.changeIndex,
          ),
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.iceBlue),
            onPressed: viewModel.navigateToCreateStreak,
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: viewModel.isLoading
            ? const Center(
                child: MonthStreakShimmer(),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SelectableCategoryRow(
                      categories: viewModel.categories,
                      onSelectionChanged: viewModel.updateSelectedCategories,
                    ),
                  ),
                  if (viewModel.tabSelectedIndexSelected == 0) ...[
                    // Tab 1: Daily view
                    if (viewModel.hasError)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "An error occurred. Please try again.",
                              style: TextStyle(color: AppColors.iceBlue),
                            ),
                          ),
                        ),
                      )
                    else if (viewModel.fullHabits.isEmpty)
                      const SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "No habits found",
                            style: TextStyle(color: AppColors.iceBlue),
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.only(
                          bottom: 130.0,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final fullHabit = viewModel.fullHabits[index];
                              final habit = fullHabit.habit;
                              return MonthStreakView(
                                datasets: viewModel.datasetsFromCompletions(
                                  fullHabit.habitCompletions,
                                ),
                                habit: habit,
                                color: AppColors.getColorByName(
                                  habit.heatMapColor ?? "creamColor",
                                ),
                              );
                            },
                            childCount: viewModel.fullHabits.length,
                          ),
                        ),
                      )
                  ] else if (viewModel.tabSelectedIndexSelected == 1) ...[
                    // Tab 2: Monthly view
                    if (viewModel.fullHabits.isEmpty)
                      const SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "No habits found",
                            style: TextStyle(color: AppColors.iceBlue),
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.only(
                          bottom: 130.0,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final fullHabit = viewModel.fullHabits[index];
                              final habit = fullHabit.habit;
                              return WeekStreakView(
                                datasets: viewModel.datasetsFromCompletions(
                                  fullHabit.habitCompletions,
                                ),
                                habit: habit,
                                color: AppColors.getColorByName(
                                  habit.heatMapColor ?? "creamColor",
                                ),
                              );
                            },
                            childCount: viewModel.fullHabits.length,
                          ),
                        ),
                      )
                  ]
                ],
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
